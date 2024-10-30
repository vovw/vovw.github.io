# introduction to rl
The agent is acting in an environment. How the environment reacts to certain actions is defined by a model which we may or may not know. The agent can stay in one of many states of the environment, and choose to take one of many actions () to switch from one state to another. Which state the agent will arrive in is decided by transition probabilities between states. Once an action is taken, the environment delivers a reward as feedback



# terms

### model-free rl
- do not reply on model of the enviroment
- directly learn the policy or value function from expirence
- generally easier to implement and tune
- more samples required to learn effectively

### model-based rl
- uses a model of the enviroment
- predicts the state transition and rewards
- allows the agent to plan ahead, potentially improving sample efficiency
- may introduce biases that degrade performance in the real environment

### Markov Decision Process (MDP)
- math framework used ot model decision-making
- has - STATES(S), ACTIONS(A), TRANSITION PROBS(P), REWARDS(R), DISCOUNT FACTOR (γ)



# algorithms

## Vanilla Policy Gradient
- stochastic policy

π(a|s,θ)
Prob(action|state, params)

- change params so as to maximise rewards
- different from TD learning, no neeed for calculating Q value or V value.
- better for continuous states



# applications


# examples


# rl based control


[home](../index.html)
