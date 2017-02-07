import matplotlib.pyplot as plt
import numpy as np

def get_stepsize(interval, steps):
	return (interval[1] - interval[0])/steps

def forward_euler(funcp, steps, init, interval):
	stepsize = get_stepsize(interval, steps)
	step_set = [init[0] + i*stepsize for i in range(steps)]
	output_set = [init[1]]
	for i, t in enumerate(step_set):
		output_set.append(output_set[i] + stepsize * funcp(t, output_set[i]))
	print(len(output_set[:-1]))
	return step_set, output_set[0:-1]

def run_cases(steps):
	xs, ys = forward_euler(lambda t,y: y, steps, (1,2), (1,4))
	myplot = plt.plot(xs, ys, 'o')#, xs, lambda t: 2*(np.e**(t-1)))
	myplot.show()
	#ode_solver(lambda t,y: -2*t*y, steps, (1,2), (1,4))
	#TODO figure out how to work with the second derivative...

run_cases(1000)
