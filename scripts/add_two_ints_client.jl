#!/usr/bin/env julia --project=".."
using RobotOS
@rosimport julia_tutorials.srv.AddTwoInts
rostypegen()
using .julia_tutorials.srv: AddTwoInts, AddTwoIntsResponse, AddTwoIntsRequest
function add_two_ints_client(x, y)
    wait_for_service("add_two_ints")
    try
        add_two_ints = ServiceProxy{AddTwoInts}("add_two_ints")
        respl = add_two_ints(AddTwoIntsRequest(x, y)) # got an AddTwoIntsResponse
        return respl.sum
    catch err
        println("Service call failed: $err")
    end
end
usage() = "$PROGRAM_FILE [x y]"
if !isinteractive()
    if length(ARGS) == 2
        x = parse(Int, ARGS[1])
        y = parse(Int, ARGS[2])
    else
        println(usage())
        exit(1)
    end
    println("Requesting $x + $y")
    println("$x + $y = $(add_two_ints_client(x, y))")
end