using Gadfly
using Debug

function stepsize(interval::Tuple{Real, Real}, steps::Int)
	return (interval[2] - interval[1])//steps
end

#Forward Euler
@debug function forwardEuler(fp, steps, init::Tuple{Real, Real}, interval::Tuple{Real, Real})
	stepSet = [init[1] + i*stepsize(interval, steps) for i in 0:steps-1]
	outputSet = Array(Real, size(stepSet))
	outputSet[1] = init[2]
	println(typeof(outputSet))
	for i in 0:size(stepSet)
		outputSet[i+1] = outputSet[i] + stepsize(interval, steps) * fp(t, outputSet[i])
	end
	return stepSet, outputSet
end
#Newton's Method
function newtonsMethod(f)
	for cnt in 1:100
		return 1
	end
end


#Trapezoidal
function trapezoidal(f, steps::Int, init::Tuple{Real, Real}, interval::Tuple{Real, Real})
	vals = [init]
	stepsize = (interval[2] - interval[1])//steps
end

#Midpoint

#RK(2)

#RK(4)

#Plot Solutions

a(t::Real)::Real = 2 * exp(t - 1)
b(t::Real)::Real = 2 * exp(1 - (t ^ 2))
c(t::Real)::Real = sin(t)

#function runCases()
fp1(t, y) = y
	xs, ys = forwardEuler(fp1,	1000,	(1, 2),	(1,4))
	fEuler = plot(x=xs, y=ys)
	draw("fEuler.png", 6inch, 6inch, fEuler)
#end

#runCases()
