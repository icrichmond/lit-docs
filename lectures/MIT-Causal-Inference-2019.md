# MIT-Causal-Inference-2019

https://www.youtube.com/watch?v=gRkUhg9Wb-I
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s897-machine-learning-for-healthcare-spring-2019/

---

[[causal-inference]]

> For predictions, one could argue that correlation is sufficient
> but data changing may lead to different results and especially with this consideration, a more robust analysis may be required

- Eg. early detection of type II diabetes
How can we predict type II diabetes?

This is a "so what" question, but when we dig deeper - what are the actions for dealing with this? Or, how do we prevent type II diabetes? It means we need to have a better understanding of the causal structure

- Eg. breast cancer survival
What is the likelihood that this breast cancer patient will survive 5 years?
Caution: survival times in the model inputs may not be considering whether or not the patient received treatment

Predictions based solely on existing data can only go as far as current practices. To go beyond this, we need to consider the causal structure

Does X cause Y?
These types of questions can usually be solved by randomized control trials

Eg. Pr(lung cancer | smoker) vs Pr(lung cancer | non smoker)
We aren't going to tell experiment participants to start smoking a lot - sometimes experiments cannot be ethically performed

To address these, we need to think causally
X input
Y output

Now 
X input
T interventions
Y output

X -> Intervention
X -> Y
Intervention -->?--> Y

In this simple example, the assumption is that the intervention does not affect X

## Rubin-Neyman
"Fundamental problem of causal inference is that we only observe one of two outcomes"

Conditional average treatment effect 

### Typical assumptions
Ignorability - no unmeasured confounds/hidden variables
Common support - need replicates/overlaps across groups

Assumption as N data samples increases towards infinity, eventually you will get overlap for consistency assumption
