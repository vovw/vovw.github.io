# introduction to rl 

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


### Q Learning
- model free
- learn optimal actions by iteratively updating Q-values based on rewards and future potential rewards.
- we use q table for storing action values for each state, while balancing trying new actions(exploring)and using best know actions(exploiting). controlling how the new info updates the old values (learning rate)



# about the methods


# applications 


# examples


# rl based control

