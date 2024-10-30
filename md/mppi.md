mppi

MPC
- computes control action solving an optimzation problem at each time step.
- at each time step, we solve an optimization problem over a finite prediction horizon to obtain a sequence of control inputs.


MPPI is a variant of MPC that uses stochasitc optimization to compute control actions.
(instead of solving deterministic optmization problem)

2 features that affect controllers perf

- trajectory 
seq of states that a system passes through over time, in MPPI we sample multiple trajectories, eval cost associated with each trajectory and then use it to determine the optimal control

- the horizon
number of time steps over which future trajectories are considered in the optmization problem

the *optimzation problem* tries to find the seq of control actions over this horizon that minimizes the expected cost

if too short, not enough foresight to make good decision
if too long, computationally complex and expensive


MPPI samples multiple control trajectories and computes the expected cost for each trajectory. The control action is then selected based on the weighted average of these trajectories.


maths

- objective functions

the system with state *x and control u*, the objective is to minimize the expected cost over a finite horizon T
$J(u) = \mathbb{E} \left[ \sum_{t=0}^{T-1} c(x_t, u_t) \right]$


State transition equation:
$x_{t+1} = f(x_t, u_t) + w_t$

Control trajectory:
$u^k = (u_0^k, u_1^k, \ldots, u_{T-1}^k)$

Cost of sampled trajectory:
$S^k = \sum_{t=0}^{T-1} c(x_t^k, u_t^k)$

Quadratic cost function:
$c(x_t, u_t) = x_t^T Q x_t + u_t^T R u_t$

Optimal control input:
$u^* = \sum_{k=1}^K w^k u_k$

the optimal control input is computed as a weighted average of the sampled control trajectory
$w^k = \frac{\exp(-\lambda S^k)}{\sum_{j=2}^K \exp(-\lambda S^j)}$


