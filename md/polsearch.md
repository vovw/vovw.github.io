# Policy learning

Description: Policy learning





Descrption:  Introduction and expirements on policy search


### Overview

1. **Character State Definition:** Define the state of the character as \([q, \dot{q}, r]\), where \(q\) is the physical pose, \(\dot{q}\) is the velocity (or derivative of pose), and \(r\) is the recurrent memory state.
2. **Neural Network Control Policy:** Introduce a neural network control policy \(\pi_\theta: s \rightarrow a\) that maps a sensory state \(s\) to an action \(a\).
3. **Trajectory Rollout with MPPI:** Use MPPI to generate trajectories and evaluate cost functions.
4. **Supervised Learning with MPPI:** Inject noise during training, use MPPI to generate trajectories and compute cost terms, and train the neural network in a supervised manner to learn from these rollouts.
5. **Real-Time Policy Execution:** Execute the learned policy in real-time for interactive control.

this works for simple systems but for anything complex need to minimize KL between the trajectories and the policy

### Implementation Details

#### 1. Character State Definition

For simplicity, we'll consider the state \(s\) of the character as \([q, \dot{q}]\), as the recurrent memory \(r\) is internal to the neural network and does not need to be explicitly defined in every rollout.

#### 2. Neural Network Control Policy

We will use a neural network to parameterize the control policy. This network will predict the control inputs given the current state.

For this example, we will use a simple feedforward neural network with 3 hidden layers of 250 units each.

```jl
using Flux

# Define the neural network
nx = model.nq + model.nv  # State dimension
nu = model.nu             # Action dimension
n_hidden = 250            # Hidden units per layer

policy_nn = Chain(Dense(nx, n_hidden, tanh),
                  Dense(n_hidden, n_hidden, tanh),
                  Dense(n_hidden, n_hidden, tanh),
                  Dense(n_hidden, nu))          # Output layer for actions (controls)
```

#### 3. Trajectory Rollout with MPPI

MPPI generates samples of trajectories by adding noise to the control actions and evaluates the cost for each rollout. Here's how you can integrate MPPI into trajectory generation.

```jl
function cost(qpos, qvel, ctrl)
    # Same as before: weights and cost calculation logic
    w_pos = 1000.0    # Position tracking
    w_height = 10.0   # Height tracking
    w_vel = 10.0      # Velocity tracking
    w_ctrl = 0.5      # Control cost

    target_height = 0.45
    target_vel_x = 0.6

    current_pos = qpos[1:3]
    current_vel = qvel[1:3]

    height_cost = w_height * (current_pos[3] - target_height)^2
    vel_cost = w_vel * (current_vel[1] - target_vel_x)^2
    lateral_cost = w_pos * (current_pos[2]^2 + current_vel[2]^2)
    ctrl_cost = w_ctrl * sum(ctrl .^ 2)

    total_cost = height_cost + vel_cost + lateral_cost + ctrl_cost
    return total_cost
end

function rollout(m::Model, d::Data, U::Matrix{Float64}, noise::Array{Float64,3})
    costs = zeros(K)
    @threads for k in 1:K
        d_copy = init_data(m)
        d_copy.qpos .= d.qpos
        d_copy.qvel .= d.qvel
        cost_sum = 0.0

        for t in 1:H
            current_state = [d_copy.qpos; d_copy.qvel]
            current_ctrl = vec(U[:, t] + noise[:, t, k])

            # Clamp control inputs
            current_ctrl = clamp.(current_ctrl, -10.0, 10.0)

            # Query the policy network for desired action (controller injection)
            desired_ctrl = policy_nn(current_state)
            d_copy.ctrl .= desired_ctrl

            mj_step(m, d_copy)
            cost_sum += cost(d_copy.qpos, d_copy.qvel, d_copy.ctrl)
        end
        costs[k] = cost_sum
    end
    return costs
end

function mppi_update!(m::Model, d::Data)
    noise = randn(nu, H, K) * Σ
    costs = rollout(m, d, U_global, noise)

    β = minimum(costs)
    weights = exp.(-1 / λ * (costs .- β))
    weights ./= sum(weights) + 1e-10

    for t in 1:H
        weighted_noise = sum(weights[k] * noise[:, t, k] for k in 1:K)
        U_global[:, t] .= clamp.(U_global[:, t] + weighted_noise, -10.0, 10.0)
    end

    d.ctrl .= U_global[:, 1]
    U_global[:, 1:end-1] .= U_global[:, 2:end]
    U_global[:, end] .= 0.0
end
```

#### 4. Supervised Learning with MPPI

Inject noise during training, leveraging MPPI for trajectory generation, and using supervised learning to train the neural network.

```jl
using Flux.Losses: mse
using Flux.Optimise: Optimiser, ADAM

# Initialize optimizer
opt = ADAM(0.01)

# Training loop
for epoch in 1:20000
    # Generate trajectory data with MPPI
    for trial in 1:150
        d.qpos = initial_positions[trial]
        d.qvel = initial_velocities[trial]

        mppi_update!(model, d)
    end

    # Prepare dataset from trajectories
    X = zeros(nx, H, 150)
    Y = zeros(nu, H, 150)
    for trial in 1:150
        d_copy = init_data(model)
        d_copy.qpos .= initial_positions[trial]
        d_copy.qvel .= initial_velocities[trial]

        for t in 1:H
            current_state = [d_copy.qpos; d_copy.qvel]
            desired_ctrl = policy_nn(current_state)

            # Store the sensory state and action for training
            X[:, t, trial] = current_state
            Y[:, t, trial] = desired_ctrl

            # Update the state with noisy control
            noisy_ctrl = clamp.(desired_ctrl + Σ * randn(nu), -10.0, 10.0)
            d_copy.ctrl .= noisy_ctrl
            mj_step(model, d_copy)
        end
    end

    # Train the neural network with the generated data
    loss = sum(mse(policy_nn(X[:, t, trial]), Y[:, t, trial]) for trial in 1:150, t in 1:H) / (150 * H)
    Flux.train!(loss, Flux.params(policy_nn), opt)
    println("Epoch $(epoch), Loss: $(loss)")
end
```

#### 5. Real-Time Policy Execution

The trained policy can then be used for real-time interactive control.

```jl
function real_time_controller(m::Model, d::Data)
    current_state = [d.qpos; d.qvel]
    desired_ctrl = policy_nn(current_state)
    return clamp.(desired_ctrl, -10.0, 10.0)
end

init_visualiser()
visualise!(model, data; controller=real_time_controller)
```

### Full Code Example

Combining all the components together, here's the full training and execution pipeline using MPPI and a neural network policy.

```jl
using MuJoCo
using LinearAlgebra
using Random
using Statistics
using Flux
using Base.Threads

# Load the model
model = load_model("models/unitree_go1/scene.xml")
data = init_data(model)

# MPPI Parameters
const K = 50  # Number of samples
const H = 30  # Horizon length
const λ = 0.2 # Temperature
const Σ = 0.3 # Noise standard deviation

nx = model.nq + model.nv  # State dimension
nu = model.nu             # Action dimension
n_hidden = 250            # Hidden units per layer

# Define the neural network policy
policy_nn = Chain(Dense(nx, n_hidden, tanh),
                  Dense(n_hidden, n_hidden, tanh),
                  Dense(n_hidden, n_hidden, tanh),
                  Dense(n_hidden, nu))

# Initialize optimizer
opt = ADAM(0.01)

const U_global = zeros(nu, H)

# Cost function
function cost(qpos, qvel, ctrl)
    w_pos = 1000.0
    w_height = 10.0
    w_vel = 10.0
    w_ctrl = 0.5

    target_height = 0.45
    target_vel_x = 0.6

    current_pos = qpos[1:3]
    current_vel = qvel[1:3]

    height_cost = w_height * (current_pos[3] - target_height)^2
    vel_cost = w_vel * (current_vel[1] - target_vel_x)^2
    lateral_cost = w_pos * (current_pos[2]^2 + current_vel[2]^2)
    ctrl_cost = w_ctrl * sum(ctrl .^ 2)

    total_cost = height_cost + vel_cost + lateral_cost + ctrl_cost
    return total_cost
end

# Rollout function using noise and neural network policy
function rollout(m::Model, d::Data, U::Matrix{Float64}, noise::Array{Float64,3})
    costs = zeros(K)
    @threads for k in 1:K
        d_copy = init_data(m)
        d_copy.qpos .= d.qpos
        d_copy.qvel .= d.qvel
        cost_sum = 0.0

        for t in 1:H
            current_state = [d_copy.qpos; d_copy.qvel]
            current_ctrl = vec(U[:, t] + noise[:, t, k])

            # Clamp control inputs
            current_ctrl = clamp.(current_ctrl, -10.0, 10.0)

            # Query the policy network for desired action (controller injection)
            desired_ctrl = policy_nn(current_state)
            d_copy.ctrl .= desired_ctrl

            mj_step(m, d_copy)
            cost_sum += cost(d_copy.qpos, d_copy.qvel, d_copy.ctrl)
        end
        costs[k] = cost_sum
    end
    return costs
end

# MPPI update function
function mppi_update!(m::Model, d::Data)
    noise = randn(nu, H, K) * Σ
    costs = rollout(m, d, U_global, noise)

    β = minimum(costs)
    weights = exp.(-1 / λ * (costs .- β))
    weights ./= sum(weights) + 1e-10  # Normalize weights

    for t in 1:H
        weighted_noise = sum(weights[k] * noise[:, t, k] for k in 1:K)
        U_global[:, t] .= clamp.(U_global[:, t] + weighted_noise, -10.0, 10.0)
    end

    d.ctrl .= U_global[:, 1]
    U_global[:, 1:end-1] .= U_global[:, 2:end]
    U_global[:, end] .= 0.0
end

# Generate dataset for training (this step can be more sophisticated)
initial_positions = [d.qpos for _ in 1:150]
initial_velocities = [d.qvel for _ in 1:150]

# Training loop
for epoch in 1:20000
    # Generate trajectory data with MPPI
    for trial in 1:150
        d.qpos = initial_positions[trial]
        d.qvel = initial_velocities[trial]

        mppi_update!(model, d)
    end

    # Prepare dataset from trajectories
    X = zeros(nx, H, 150)
    Y = zeros(nu, H, 150)
    for trial in 1:150
        d_copy = init_data(model)
        d_copy.qpos .= initial_positions[trial]
        d_copy.qvel .= initial_velocities[trial]

        for t in 1:H
            current_state = [d_copy.qpos; d_copy.qvel]
            desired_ctrl = policy_nn(current_state)

            # Store the sensory state and action for training
            X[:, t, trial] = current_state
            Y[:, t, trial] = desired_ctrl

            # Update the state with noisy control
            noisy_ctrl = clamp.(desired_ctrl + Σ * randn(nu), -10.0, 10.0)
            d_copy.ctrl .= noisy_ctrl
            mj_step(model, d_copy)
        end
    end

    # Train the neural network with the generated data
    loss = sum(mse(policy_nn(X[:, t, trial]), Y[:, t, trial]) for trial in 1:150, t in 1:H) / (150 * H)
    Flux.train!(loss, Flux.params(policy_nn), opt)
    println("Epoch $(epoch), Loss: $(loss)")
end

# Real-time controller function
function real_time_controller(m::Model, d::Data)
    current_state = [d.qpos; d.qvel]
    desired_ctrl = policy_nn(current_state)
    return clamp.(desired_ctrl, -10.0, 10.0)
end

# Visualize and evaluate the trained policy
init_visualiser()
visualise!(model, data; controller=real_time_controller)
```

### Conclusion

This implementation leverages MPPI for trajectory generation during training, allowing the neural network to learn from optimal but noisy control inputs. By injecting noise, the method prevents overfitting and ensures generalization. The real-time controller uses the learned neural network policy to interactively control the character, achieving complex and stable behaviors.

### Future Work

- **Adaptive MPC:** Consider adding adaptive features to the MPC to better handle different terrains and perturbations.
- **Learning from Perturbations:** Incorporate learning from unexpected changes in the task specification and handle perturbations due to noise and modeling errors.
- **Diverse Characters:** Experiment with different character morphologies and extend the method to cover more diverse behaviors, such as swimming and flying.

This hybrid approach of MPPI and neural networks promises robust and versatile controllers for interactive character control tasks.
