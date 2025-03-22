# Model Predictive Path Integral Control








## Introduction to MPC

Model Predictive Control (MPC) is a control method with the following key characteristics:
- Computes control action by solving an optimization problem at each time step
- At each time step, we solve an optimization problem over a finite prediction horizon to obtain a sequence of control inputs
- Uses a model of the system to predict future states

## MPPI: A Stochastic Approach

MPPI (Model Predictive Path Integral) is a variant of MPC that uses stochastic optimization to compute control actions, instead of solving a deterministic optimization problem.

### Key Components Affecting Controller Performance

#### 1. Trajectory
- A sequence of states that a system passes through over time
- In MPPI, we sample multiple trajectories, evaluate the cost associated with each trajectory, and then use it to determine the optimal control
- This sampling approach allows MPPI to handle non-linear dynamics and complex cost functions

#### 2. The Horizon
- The number of time steps over which future trajectories are considered in the optimization problem
- The optimization problem tries to find the sequence of control actions over this horizon that minimizes the expected cost
- Trade-offs:
  - If too short: not enough foresight to make good decisions
  - If too long: computationally complex and expensive

### MPPI Algorithm Overview

MPPI samples multiple control trajectories and computes the expected cost for each trajectory. The control action is then selected based on the weighted average of these trajectories, with weights determined by the relative costs.


## Mathematical Formulation

### Objective Functions

For a system with state *x* and control *u*, the objective is to minimize the expected cost over a finite horizon T:

$$J(u) = \mathbb{E} \left[ \sum_{t=0}^{T-1} c(x_t, u_t) \right]$$

Where:
- $c(x_t, u_t)$ is the instantaneous cost at time step $t$
- $T$ is the prediction horizon
- $\mathbb{E}[\cdot]$ denotes expectation

### Key Equations

**State Transition Equation:**  
$$x_{t+1} = f(x_t, u_t) + w_t$$

Where $f(x_t, u_t)$ is the system dynamics model and $w_t$ is the process noise.

**Control Trajectory:**  
$$u^k = (u_0^k, u_1^k, \ldots, u_{T-1}^k)$$

Representing the k-th sampled control sequence over the horizon.

**Cost of Sampled Trajectory:**  
$$S^k = \sum_{t=0}^{T-1} c(x_t^k, u_t^k)$$

The total cost associated with the k-th trajectory.

**Quadratic Cost Function (commonly used):**  
$$c(x_t, u_t) = x_t^T Q x_t + u_t^T R u_t$$

Where $Q$ and $R$ are weight matrices for state and control costs respectively.

### Computing the Optimal Control

The optimal control input is computed as a weighted average of the sampled control trajectories:

$$u^* = \sum_{k=1}^K w^k u_k$$

With weights determined by the relative costs:

$$w^k = \frac{\exp(-\lambda S^k)}{\sum_{j=1}^K \exp(-\lambda S^j)}$$

Where $\lambda$ is a temperature parameter that affects the selectivity of the weighting.


