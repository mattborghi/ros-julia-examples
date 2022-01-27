#!/usr/bin/env julia --project=".."
using RobotOS
@rosimport julia_tutorials.srv.AddTwoInts
rostypegen()
# three types are generated in a submodule .[package].srv
using .julia_tutorials.srv: AddTwoInts, AddTwoIntsResponse, AddTwoIntsRequest
function handle_add_two_ints(req)
    println("Returning [$(req.a) + $(req.b) = $(req.a + req.b)]")
    return AddTwoIntsResponse(req.a + req.b)
end
function add_two_ints_server()
    init_node("add_two_ints_server") # node name
    s = Service{AddTwoInts}("add_two_ints", handle_add_two_ints) # service name
    println("Ready to add two ints")
    spin()
end
if !isinteractive()
    add_two_ints_server()
end
