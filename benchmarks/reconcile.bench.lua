local Roact = require(script.Parent.Parent.Roact)

local handle

return {
	iterations = 100000,
	setup = function()
		handle = Roact.mount(Roact.createElement("StringValue", {
			Value = "Initial",
		}))
	end,
	teardown = function()
		Roact.unmount(handle)
	end,
	step = function(i)
		handle = Roact.reconcile(handle, Roact.createElement("StringValue", {
			Value = tostring(i),
		}))
	end,
}