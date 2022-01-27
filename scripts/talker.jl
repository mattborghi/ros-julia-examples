#!/usr/bin/env julia --project="../"
using RobotOS
@rosimport std_msgs.msg.String
rostypegen()
using .std_msgs.msg: StringMsg
function talker()
    println("Inside talker")
    init_node("talker") # node name
    pub = Publisher{StringMsg}("chatter", queue_size=10) # topic name
    rate = Rate(10) # 10 Hz
    while !is_shutdown()
        hello_str = "hello world $(to_sec(get_rostime()))"
        loginfo(hello_str)
        publish(pub, StringMsg(hello_str))
        rossleep(rate)
    end
end
if !isinteractive()
    println("Running in non-interactive mode")
    talker()
end