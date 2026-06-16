local linkBridge =  peripheral.find("redstone_link_bridge")
local currentMotion = "idleFlap"

local frequencies = {
    left = {
        front = {
            top = {
                idleHoz = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_sapling" } , { "simulated:white_symmetric_sail" , "minecraft:acacia_door" } },
                idleVer = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_sapling" } , { "minecraft:acacia_door" , "simulated:white_symmetric_sail" } },

                idleFlap = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_door" } , { "simulated:white_symmetric_sail" , "minecraft:acacia_door" } },
                forward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_door" } , { "minecraft:redstone_torch" , "minecraft:acacia_trapdoor" } },
                backward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_door" } , { "minecraft:acacia_trapdoor" , "minecraft:redstone_torch" } },
                upForward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_door" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_trapdoor" } },
                downForward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_door" } , { "minecraft:acacia_trapdoor" , "synaxis:dynamic_revolute_motor" } },
                upBackward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_door" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_door" } },
                downBackward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_door" } , { "minecraft:acacia_door" , "synaxis:dynamic_revolute_motor" } },
                
                forwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_door" } , { "minecraft:redstone_torch" , "minecraft:acacia_trapdoor" } },
                backwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_door" } , { "minecraft:acacia_trapdoor" , "minecraft:redstone_torch" } },
                upForwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_door" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_trapdoor" } },
                downForwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_door" } , { "minecraft:acacia_trapdoor" , "synaxis:dynamic_revolute_motor" } },
                upBackwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_door" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_door" } },
                downBackwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_door" } , { "minecraft:acacia_door" , "synaxis:dynamic_revolute_motor" } },
            },
            bottom = {
                idleHoz = { { "minecraft:acacia_sapling" , "synaxis:dynamic_joint_motor" } , { "simulated:white_symmetric_sail" , "minecraft:acacia_fence" } },
                idleVer = { { "minecraft:acacia_sapling" , "synaxis:dynamic_joint_motor" } , { "minecraft:acacia_fence" , "simulated:white_symmetric_sail" } },

                idleFlap = { { "minecraft:acacia_door" , "synaxis:dynamic_joint_motor" } , { "simulated:white_symmetric_sail" , "minecraft:acacia_fence" } },
                forward = { { "minecraft:acacia_door" , "synaxis:dynamic_joint_motor" } , { "minecraft:redstone_torch" , "minecraft:acacia_fence" } },
                backward = { { "minecraft:acacia_door" , "synaxis:dynamic_joint_motor" } , { "minecraft:acacia_fence" , "minecraft:redstone_torch" } },
                upForward = { { "minecraft:acacia_door" , "synaxis:dynamic_joint_motor" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_fence" } },
                downForward = { { "minecraft:acacia_door" , "synaxis:dynamic_joint_motor" } , { "minecraft:acacia_fence" , "synaxis:dynamic_revolute_motor" } },
                upBackward = { { "minecraft:acacia_door" , "synaxis:dynamic_joint_motor" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_fence_gate" } },
                downBackward = { { "minecraft:acacia_door" , "synaxis:dynamic_joint_motor" } , { "minecraft:acacia_fence_gate" , "synaxis:dynamic_revolute_motor" } },
                
                forwardFast = { { "minecraft:acacia_door" , "create:mechanical_bearing" } , { "minecraft:redstone_torch" , "minecraft:acacia_fence" } },
                backwardFast = { { "minecraft:acacia_door" , "create:mechanical_bearing" } , { "minecraft:acacia_fence" , "minecraft:redstone_torch" } },
                upForwardFast = { { "minecraft:acacia_door" , "create:mechanical_bearing" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_fence" } },
                downForwardFast = { { "minecraft:acacia_door" , "create:mechanical_bearing" } , { "minecraft:acacia_fence" , "synaxis:dynamic_revolute_motor" } },
                upBackwardFast = { { "minecraft:acacia_door" , "create:mechanical_bearing" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_fence_gate" } },
                downBackwardFast = { { "minecraft:acacia_door" , "create:mechanical_bearing" } , { "minecraft:acacia_fence_gate" , "synaxis:dynamic_revolute_motor" } },
            },
        },
        back = {
            top = {
                idleVer = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_chest_boat" } , { "simulated:white_symmetric_sail" , "minecraft:acacia_pressure_plate" } },
                idleHoz = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_chest_boat" } , { "minecraft:acacia_pressure_plate" , "simulated:white_symmetric_sail" } },

                idleFlap = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_planks" } , { "simulated:white_symmetric_sail" , "minecraft:acacia_pressure_plate" } },
                forward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_planks" } , { "minecraft:redstone_torch" , "minecraft:acacia_pressure_plate" } },
                backward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_planks" } , { "minecraft:acacia_pressure_plate" , "minecraft:redstone_torch" } },
                upForward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_planks" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_pressure_plate" } },
                downForward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_planks" } , { "minecraft:acacia_pressure_plate" , "synaxis:dynamic_revolute_motor" } },
                upBackward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_planks" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_button" } },
                downBackward = { { "synaxis:dynamic_joint_motor" , "minecraft:acacia_planks" } , { "minecraft:acacia_button" , "synaxis:dynamic_revolute_motor" } },

                forwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_planks" } , { "minecraft:redstone_torch" , "minecraft:acacia_pressure_plate" } },
                backwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_planks" } , { "minecraft:acacia_pressure_plate" , "minecraft:redstone_torch" } },
                upForwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_planks" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_pressure_plate" } },
                downForwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_planks" } , { "minecraft:acacia_pressure_plate" , "synaxis:dynamic_revolute_motor" } },
                upBackwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_planks" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_button" } },
                downBackwardFast = { { "create:mechanical_bearing" , "minecraft:acacia_planks" } , { "minecraft:acacia_button" , "synaxis:dynamic_revolute_motor" } },
            },
            bottom = {
                idleVer = { { "minecraft:acacia_chest_boat" , "synaxis:dynamic_joint_motor" } , { "simulated:white_symmetric_sail" , "minecraft:acacia_slab" } },
                idleHoz = { { "minecraft:acacia_chest_boat" , "synaxis:dynamic_joint_motor" } , { "minecraft:acacia_slab" , "simulated:white_symmetric_sail" } },

                idleFlap = { { "minecraft:acacia_planks" , "synaxis:dynamic_joint_motor" } , { "simulated:white_symmetric_sail" , " minecraft:acacia_slab "}},
                forward = { { "minecraft:acacia_planks" , "synaxis:dynamic_joint_motor" } , { "minecraft:redstone_torch" , "minecraft:acacia_slab" } },
                backward = { { "minecraft:acacia_planks" , "synaxis:dynamic_joint_motor" } , { "minecraft:acacia_slab" , "minecraft:redstone_torch" } },
                upForward = { { "minecraft:acacia_planks" , "synaxis:dynamic_joint_motor" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_slab" } },
                downForward = { { "minecraft:acacia_planks" , "synaxis:dynamic_joint_motor" } , { "minecraft:acacia_slab" , "synaxis:dynamic_revolute_motor" } },
                upBackward = { { "minecraft:acacia_planks" , "synaxis:dynamic_joint_motor" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_stairs" } },
                downBackward = { { "minecraft:acacia_planks" , "synaxis:dynamic_joint_motor" } , { "minecraft:acacia_stairs" , "synaxis:dynamic_revolute_motor" } },
                
                forwardFast = { { "minecraft:acacia_planks" , "create:mechanical_bearing" } , { "minecraft:redstone_torch" , "minecraft:acacia_slab" } },
                backwardFast = { { "minecraft:acacia_planks" , "create:mechanical_bearing" } , { "minecraft:acacia_slab" , "minecraft:redstone_torch" } },
                upForwardFast = { { "minecraft:acacia_planks" , "create:mechanical_bearing" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_slab" } },
                downForwardFast = { { "minecraft:acacia_planks" , "create:mechanical_bearing" } , { "minecraft:acacia_slab" , "synaxis:dynamic_revolute_motor" } },
                upBackwardFast = { { "minecraft:acacia_planks" , "create:mechanical_bearing" } , { "synaxis:dynamic_revolute_motor" , "minecraft:acacia_stairs" } },
                downBackwardFast = { { "minecraft:acacia_planks" , "create:mechanical_bearing" } , { "minecraft:acacia_stairs" , "synaxis:dynamic_revolute_motor" } },
            },
        }
    },
    right = {
        front = {
            top = {
                idleVer = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_sapling" } , { "simulated:white_symmetric_sail" , "minecraft:oak_trapdoor" } },
                idleHoz = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_sapling" } , { "minecraft:oak_trapdoor" , "simulated:white_symmetric_sail" } },

                idleFlap = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_door" } , { "simulated:white_symmetric_sail" , "minecraft:oak_trapdoor" } },
                forward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_door" } , { "minecraft:redstone_torch" , "minecraft:oak_trapdoor" } },
                backward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_door" } , { "minecraft:oak_trapdoor" , "minecraft:redstone_torch" } },
                upForward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_door" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_trapdoor" } },
                downForward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_door" } , { "minecraft:oak_trapdoor" , "synaxis:dynamic_revolute_motor" } },
                upBackward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_door" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_door" } },
                downBackward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_door" } , { "minecraft:oak_door" , "synaxis:dynamic_revolute_motor" } },
                
                forwardFast = { { "create:mechanical_bearing" , "minecraft:oak_door" } , { "minecraft:redstone_torch" , "minecraft:oak_trapdoor" } },
                backwardFast = { { "create:mechanical_bearing" , "minecraft:oak_door" } , { "minecraft:oak_trapdoor" , "minecraft:redstone_torch" } },
                upForwardFast = { { "create:mechanical_bearing" , "minecraft:oak_door" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_trapdoor" } },
                downForwardFast = { { "create:mechanical_bearing" , "minecraft:oak_door" } , { "minecraft:oak_trapdoor" , "synaxis:dynamic_revolute_motor" } },
                upBackwardFast = { { "create:mechanical_bearing" , "minecraft:oak_door" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_door" } },
                downBackwardFast = { { "create:mechanical_bearing" , "minecraft:oak_door" } , { "minecraft:oak_door" , "synaxis:dynamic_revolute_motor" } },
            },
            bottom = {
                idleVer = { { "minecraft:oak_sapling" , "synaxis:dynamic_joint_motor" } , { "simulated:white_symmetric_sail" , "minecraft:oak_fence" } },
                idleHoz = { { "minecraft:oak_sapling" , "synaxis:dynamic_joint_motor" } , { "minecraft:oak_fence" , "simulated:white_symmetric_sail" } },

                idleFlap = { { "minecraft:oak_door" , "synaxis:dynamic_joint_motor" } , { "simulated:white_symmetric_sail" , "minecraft:oak_fence" } },
                forward = { { "minecraft:oak_door" , "synaxis:dynamic_joint_motor" } , { "minecraft:redstone_torch" , "minecraft:oak_fence" } },
                backward = { { "minecraft:oak_door" , "synaxis:dynamic_joint_motor" } , { "minecraft:oak_fence" , "minecraft:redstone_torch" } },
                upForward = { { "minecraft:oak_door" , "synaxis:dynamic_joint_motor" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_fence" } },
                downForward = { { "minecraft:oak_door" , "synaxis:dynamic_joint_motor" } , { "minecraft:oak_fence" , "synaxis:dynamic_revolute_motor" } },
                upBackward = { { "minecraft:oak_door" , "synaxis:dynamic_joint_motor" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_fence_gate" } },
                downBackward = { { "minecraft:oak_door" , "synaxis:dynamic_joint_motor" } , { "minecraft:oak_fence_gate" , "synaxis:dynamic_revolute_motor" } },
                
                forwardFast = { { "minecraft:oak_door" , "create:mechanical_bearing" } , { "minecraft:redstone_torch" , "minecraft:oak_fence" } },
                backwardFast = { { "minecraft:oak_door" , "create:mechanical_bearing" } , { "minecraft:oak_fence" , "minecraft:redstone_torch" } },
                upForwardFast = { { "minecraft:oak_door" , "create:mechanical_bearing" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_fence" } },
                downForwardFast = { { "minecraft:oak_door" , "create:mechanical_bearing" } , { "minecraft:oak_fence" , "synaxis:dynamic_revolute_motor" } },
                upBackwardFast = { { "minecraft:oak_door" , "create:mechanical_bearing" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_fence_gate" } },
                downBackwardFast = { { "minecraft:oak_door" , "create:mechanical_bearing" } , { "minecraft:oak_fence_gate" , "synaxis:dynamic_revolute_motor" } },
            },
        },
        back = {
            top = {
                idleHoz = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_chest_boat" } , { "simulated:white_symmetric_sail" , "minecraft:oak_pressure_plate" } },
                idleVer = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_chest_boat" } , { "minecraft:oak_pressure_plate" , "simulated:white_symmetric_sail" } },
                
                idleFlap = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_planks" } , { "simulated:white_symmetric_sail" , "minecraft:oak_pressure_plate" } },
                forward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_planks" } , { "minecraft:redstone_torch" , "minecraft:oak_pressure_plate" } },
                backward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_planks" } , { "minecraft:oak_pressure_plate" , "minecraft:redstone_torch" } },
                upForward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_planks" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_pressure_plate" } },
                downForward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_planks" } , { "minecraft:oak_pressure_plate" , "synaxis:dynamic_revolute_motor" } },
                upBackward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_planks" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_button" } },
                downBackward = { { "synaxis:dynamic_joint_motor" , "minecraft:oak_planks" } , { "minecraft:oak_button" , "synaxis:dynamic_revolute_motor" } },
                
                forwardFast = { { "create:mechanical_bearing" , "minecraft:oak_planks" } , { "minecraft:redstone_torch" , "minecraft:oak_pressure_plate" } },
                backwardFast = { { "create:mechanical_bearing" , "minecraft:oak_planks" } , { "minecraft:oak_pressure_plate" , "minecraft:redstone_torch" } },
                upForwardFast = { { "create:mechanical_bearing" , "minecraft:oak_planks" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_pressure_plate" } },
                downForwardFast = { { "create:mechanical_bearing" , "minecraft:oak_planks" } , { "minecraft:oak_pressure_plate" , "synaxis:dynamic_revolute_motor" } },
                upBackwardFast = { { "create:mechanical_bearing" , "minecraft:oak_planks" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_button" } },
                downBackwardFast = { { "create:mechanical_bearing" , "minecraft:oak_planks" } , { "minecraft:oak_button" , "synaxis:dynamic_revolute_motor" } },
            },
            bottom = {
                idleHoz = { { "minecraft:oak_chest_boat" , "synaxis:dynamic_joint_motor" } , { "simulated:white_symmetric_sail" , "minecraft:oak_slab" } },
                idleVer = { { "minecraft:oak_chest_boat" , "synaxis:dynamic_joint_motor" } , { "minecraft:oak_slab" , "simulated:white_symmetric_sail" } },

                idleFlap = { { "minecraft:oak_planks" , "synaxis:dynamic_joint_motor" } , { "simulated:white_symmetric_sail" , " minecraft:oak_slab "} },
                forward = { { "minecraft:oak_planks" , "synaxis:dynamic_joint_motor" } , { "minecraft:redstone_torch" , "minecraft:oak_slab" } },
                backward = { { "minecraft:oak_planks" , "synaxis:dynamic_joint_motor" } , { "minecraft:oak_slab" , "minecraft:redstone_torch" } },
                upForward = { { "minecraft:oak_planks" , "synaxis:dynamic_joint_motor" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_slab" } },
                downForward = { { "minecraft:oak_planks" , "synaxis:dynamic_joint_motor" } , { "minecraft:oak_slab" , "synaxis:dynamic_revolute_motor" } },
                upBackward = { { "minecraft:oak_planks" , "synaxis:dynamic_joint_motor" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_stairs" } },
                downBackward = { { "minecraft:oak_planks" , "synaxis:dynamic_joint_motor" } , { "minecraft:oak_stairs" , "synaxis:dynamic_revolute_motor" } },
                
                forwardFast = { { "minecraft:oak_planks" , "create:mechanical_bearing" } , { "minecraft:redstone_torch" , "minecraft:oak_slab" } },
                backwardFast = { { "minecraft:oak_planks" , "create:mechanical_bearing" } , { "minecraft:oak_slab" , "minecraft:redstone_torch" } },
                upForwardFast = { { "minecraft:oak_planks" , "create:mechanical_bearing" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_slab" } },
                downForwardFast = { { "minecraft:oak_planks" , "create:mechanical_bearing" } , { "minecraft:oak_slab" , "synaxis:dynamic_revolute_motor" } },
                upBackwardFast = { { "minecraft:oak_planks" , "create:mechanical_bearing" } , { "synaxis:dynamic_revolute_motor" , "minecraft:oak_stairs" } },
                downBackwardFast = { { "minecraft:oak_planks" , "create:mechanical_bearing" } , { "minecraft:oak_stairs" , "synaxis:dynamic_revolute_motor" } },
            },
        }
    }
}


local flightMotions = {
    wingsUnfold = {  
        leftBotFront = frequencies.left.front.top.idleHoz,
        leftTopFront = frequencies.left.front.bottom.idleHoz,
        rightBotFront = frequencies.left.back.top.idleHoz,
        rightTopFront = frequencies.left.back.bottom.idleHoz,
        leftBotBack = frequencies.right.front.top.idleHoz,
        leftTopBack = frequencies.right.front.bottom.idleHoz,
        rightBotBack = frequencies.right.back.top.idleHoz,
        rightTopBack = frequencies.right.back.bottom.idleHoz,
    },
    wingsFold = {  
        leftBotFront = frequencies.left.front.top.idleHoz,
        leftTopFront = frequencies.left.front.bottom.idleHoz,
        rightBotFront = frequencies.left.back.top.idleHoz,
        rightTopFront = frequencies.left.back.bottom.idleHoz,
        leftBotBack = frequencies.right.front.top.idleVer,
        leftTopBack = frequencies.right.front.bottom.idleVer,
        rightBotBack = frequencies.right.back.top.idleVer,
        rightTopBack = frequencies.right.back.bottom.idleVer,
    },
    --glideYawLeft = {
    --},
    --glideYawRight = {
    --},
    --glidePitchUp = {
    --},
    --glidePitchDown = {
    --},
    --glideRollLeft = {
    --},
    --glideRollRight = {
    --},
    --glide = {
    --},
    flyForwardUpYawLeft = {  
        leftBotFront = frequencies.left.front.top.upBackward,
        leftTopFront = frequencies.left.front.bottom.upForward,
        rightBotFront = frequencies.left.back.top.upForward,
        rightTopFront = frequencies.left.back.bottom.upForward,
        leftBotBack = frequencies.right.front.top.upBackward,
        leftTopBack = frequencies.right.front.bottom.upForward,
        rightBotBack = frequencies.right.back.top.upForward,
        rightTopBack = frequencies.right.back.bottom.upForward,
    },
    flyForwardUpYawRight = {  
        leftBotFront = frequencies.left.front.top.upForward,
        leftTopFront = frequencies.left.front.bottom.upForward,
        rightBotFront = frequencies.left.back.top.upBackward,
        rightTopFront = frequencies.left.back.bottom.upForward,
        leftBotBack = frequencies.right.front.top.upForward,
        leftTopBack = frequencies.right.front.bottom.upForward,
        rightBotBack = frequencies.right.back.top.upBackward,
        rightTopBack = frequencies.right.back.bottom.upForward,
    },
    flyForwardDownYawLeft = {  
        leftBotFront = frequencies.left.front.top.downBackward,
        leftTopFront = frequencies.left.front.bottom.downForward,
        rightBotFront = frequencies.left.back.top.downForward,
        rightTopFront = frequencies.left.back.bottom.downForward,
        leftBotBack = frequencies.right.front.top.downBackward,
        leftTopBack = frequencies.right.front.bottom.downForward,
        rightBotBack = frequencies.right.back.top.downForward,
        rightTopBack = frequencies.right.back.bottom.downForward,
    },
    flyForwardDownYawRight = {  
        leftBotFront = frequencies.left.front.top.downForward,
        leftTopFront = frequencies.left.front.bottom.downForward,
        rightBotFront = frequencies.left.back.top.downBackward,
        rightTopFront = frequencies.left.back.bottom.downForward,
        leftBotBack = frequencies.right.front.top.downForward,
        leftTopBack = frequencies.right.front.bottom.downForward,
        rightBotBack = frequencies.right.back.top.downBackward,
        rightTopBack = frequencies.right.back.bottom.downForward,
    },
    flyBackwardUpYawLeft = {  
        leftBotFront = frequencies.left.front.top.upBackward,
        leftTopFront = frequencies.left.front.bottom.upBackward,
        rightBotFront = frequencies.left.back.top.upBackward,
        rightTopFront = frequencies.left.back.bottom.upForward,
        leftBotBack = frequencies.right.front.top.upBackward,
        leftTopBack = frequencies.right.front.bottom.upBackward,
        rightBotBack = frequencies.right.back.top.upBackward,
        rightTopBack = frequencies.right.back.bottom.upForward,
    },
    flyBackwardUpYawRight = {  
        leftBotFront = frequencies.left.front.top.upBackward,
        leftTopFront = frequencies.left.front.bottom.upForward,
        rightBotFront = frequencies.left.back.top.upBackward,
        rightTopFront = frequencies.left.back.bottom.upBackward,
        leftBotBack = frequencies.right.front.top.upBackward,
        leftTopBack = frequencies.right.front.bottom.upForward,
        rightBotBack = frequencies.right.back.top.upBackward,
        rightTopBack = frequencies.right.back.bottom.upBackward,
    },
    flyBackwardDownYawLeft = {  
        leftBotFront = frequencies.left.front.top.downBackward,
        leftTopFront = frequencies.left.front.bottom.downBackward,
        rightBotFront = frequencies.left.back.top.downBackward,
        rightTopFront = frequencies.left.back.bottom.downForward,
        leftBotBack = frequencies.right.front.top.downBackward,
        leftTopBack = frequencies.right.front.bottom.downBackward,
        rightBotBack = frequencies.right.back.top.downBackward,
        rightTopBack = frequencies.right.back.bottom.downForward,
    },
    flyBackwardDownYawRight = {  
        leftBotFront = frequencies.left.front.top.downBackward,
        leftTopFront = frequencies.left.front.bottom.downForward,
        rightBotFront = frequencies.left.back.top.downBackward,
        rightTopFront = frequencies.left.back.bottom.downBackward,
        leftBotBack = frequencies.right.front.top.downBackward,
        leftTopBack = frequencies.right.front.bottom.downForward,
        rightBotBack = frequencies.right.back.top.downBackward,
        rightTopBack = frequencies.right.back.bottom.downBackward,
    },
    flyForwardUpPitchUp = {  
        leftBotFront = frequencies.left.front.top.upForwardFast,
        leftTopFront = frequencies.left.front.bottom.upForwardFast,
        rightBotFront = frequencies.left.back.top.upForwardFast,
        rightTopFront = frequencies.left.back.bottom.upForwardFast,
        leftBotBack = frequencies.right.front.top.upForward,
        leftTopBack = frequencies.right.front.bottom.upForward,
        rightBotBack = frequencies.right.back.top.upForward,
        rightTopBack = frequencies.right.back.bottom.upForward,
    },
    flyForwardUpPitchDown = {  
        leftBotFront = frequencies.left.front.top.upForward,
        leftTopFront = frequencies.left.front.bottom.upForward,
        rightBotFront = frequencies.left.back.top.upForward,
        rightTopFront = frequencies.left.back.bottom.upForward,
        leftBotBack = frequencies.right.front.top.upForwardFast,
        leftTopBack = frequencies.right.front.bottom.upForwardFast,
        rightBotBack = frequencies.right.back.top.upForwardFast,
        rightTopBack = frequencies.right.back.bottom.upForwardFast,
    },
    flyForwardDownPitchUp = {  
        leftBotFront = frequencies.left.front.top.downForward,
        leftTopFront = frequencies.left.front.bottom.downForward,
        rightBotFront = frequencies.left.back.top.downForward,
        rightTopFront = frequencies.left.back.bottom.downForward,
        leftBotBack = frequencies.right.front.top.downForwardFast,
        leftTopBack = frequencies.right.front.bottom.downForwardFast,
        rightBotBack = frequencies.right.back.top.downForwardFast,
        rightTopBack = frequencies.right.back.bottom.downForwardFast,
    },
    flyForwardDownPitchDown = {  
        leftBotFront = frequencies.left.front.top.downForwardFast,
        leftTopFront = frequencies.left.front.bottom.downForwardFast,
        rightBotFront = frequencies.left.back.top.downForwardFast,
        rightTopFront = frequencies.left.back.bottom.downForwardFast,
        leftBotBack = frequencies.right.front.top.downForward,
        leftTopBack = frequencies.right.front.bottom.downForward,
        rightBotBack = frequencies.right.back.top.downForward,
        rightTopBack = frequencies.right.back.bottom.downForward,
    },
    flyBackwardUpPitchUp = {  
        leftBotFront = frequencies.left.front.top.upBackwardFast,
        leftTopFront = frequencies.left.front.bottom.upBackwardFast,
        rightBotFront = frequencies.left.back.top.upBackwardFast,
        rightTopFront = frequencies.left.back.bottom.upBackwardFast,
        leftBotBack = frequencies.right.front.top.upBackward,
        leftTopBack = frequencies.right.front.bottom.upBackward,
        rightBotBack = frequencies.right.back.top.upBackward,
        rightTopBack = frequencies.right.back.bottom.upBackward,
    },
    flyBackwardUpPitchDown = {  
        leftBotFront = frequencies.left.front.top.upBackward,
        leftTopFront = frequencies.left.front.bottom.upBackward,
        rightBotFront = frequencies.left.back.top.upBackward,
        rightTopFront = frequencies.left.back.bottom.upBackward,
        leftBotBack = frequencies.right.front.top.upBackwardFast,
        leftTopBack = frequencies.right.front.bottom.upBackwardFast,
        rightBotBack = frequencies.right.back.top.upBackwardFast,
        rightTopBack = frequencies.right.back.bottom.upBackwardFast,
    },
    flyBackwardDownPitchUp = {  
        leftBotFront = frequencies.left.front.top.downBackward,
        leftTopFront = frequencies.left.front.bottom.downBackward,
        rightBotFront = frequencies.left.back.top.downBackward,
        rightTopFront = frequencies.left.back.bottom.downBackward,
        leftBotBack = frequencies.right.front.top.downBackwardFast,
        leftTopBack = frequencies.right.front.bottom.downBackwardFast,
        rightBotBack = frequencies.right.back.top.downBackwardFast,
        rightTopBack = frequencies.right.back.bottom.downBackwardFast,
    },
    flyBackwardDownPitchDown = {  
        leftBotFront = frequencies.left.front.top.downBackwardFast,
        leftTopFront = frequencies.left.front.bottom.downBackwardFast,
        rightBotFront = frequencies.left.back.top.downBackwardFast,
        rightTopFront = frequencies.left.back.bottom.downBackwardFast,
        leftBotBack = frequencies.right.front.top.downBackward,
        leftTopBack = frequencies.right.front.bottom.downBackward,
        rightBotBack = frequencies.right.back.top.downBackward,
        rightTopBack = frequencies.right.back.bottom.downBackward,
    },
    flyForwardUpRollLeft = {  
        leftBotFront = frequencies.left.front.top.upForwardFast,
        leftTopFront = frequencies.left.front.bottom.upForwardFast,
        rightBotFront = frequencies.left.back.top.upForward,
        rightTopFront = frequencies.left.back.bottom.upForward,
        leftBotBack = frequencies.right.front.top.upForwardFast,
        leftTopBack = frequencies.right.front.bottom.upForwardFast,
        rightBotBack = frequencies.right.back.top.upForward,
        rightTopBack = frequencies.right.back.bottom.upForward,
    },
    flyForwardUpRollRight = {  
        leftBotFront = frequencies.left.front.top.upForward,
        leftTopFront = frequencies.left.front.bottom.upForward,
        rightBotFront = frequencies.left.back.top.upForwardFast,
        rightTopFront = frequencies.left.back.bottom.upForwardFast,
        leftBotBack = frequencies.right.front.top.upForward,
        leftTopBack = frequencies.right.front.bottom.upForward,
        rightBotBack = frequencies.right.back.top.upForwardFast,
        rightTopBack = frequencies.right.back.bottom.upForwardFast,
    },
    flyForwardDownRollLeft = {  
        leftBotFront = frequencies.left.front.top.downForwardFast,
        leftTopFront = frequencies.left.front.bottom.downForwardFast,
        rightBotFront = frequencies.left.back.top.downForward,
        rightTopFront = frequencies.left.back.bottom.downForward,
        leftBotBack = frequencies.right.front.top.downForwardFast,
        leftTopBack = frequencies.right.front.bottom.downForwardFast,
        rightBotBack = frequencies.right.back.top.downForward,
        rightTopBack = frequencies.right.back.bottom.downForward,
    },
    flyForwardDownRollRight = {  
        leftBotFront = frequencies.left.front.top.downForward,
        leftTopFront = frequencies.left.front.bottom.downForward,
        rightBotFront = frequencies.left.back.top.downForwardFast,
        rightTopFront = frequencies.left.back.bottom.downForwardFast,
        leftBotBack = frequencies.right.front.top.downForward,
        leftTopBack = frequencies.right.front.bottom.downForward,
        rightBotBack = frequencies.right.back.top.downForwardFast,
        rightTopBack = frequencies.right.back.bottom.downForwardFast,
    },
    flyBackwardUpRollLeft = {  
        leftBotFront = frequencies.left.front.top.upBackward,
        leftTopFront = frequencies.left.front.bottom.upBackward,
        rightBotFront = frequencies.left.back.top.upBackwardFast,
        rightTopFront = frequencies.left.back.bottom.upBackwardFast,
        leftBotBack = frequencies.right.front.top.upBackward,
        leftTopBack = frequencies.right.front.bottom.upBackward,
        rightBotBack = frequencies.right.back.top.upBackwardFast,
        rightTopBack = frequencies.right.back.bottom.upBackwardFast,
    },
    flyBackwardUpRollRight = { 
        leftBotFront = frequencies.left.front.top.upBackwardFast,
        leftTopFront = frequencies.left.front.bottom.upBackwardFast,
        rightBotFront = frequencies.left.back.top.upBackward,
        rightTopFront = frequencies.left.back.bottom.upBackward,
        leftBotBack = frequencies.right.front.top.upBackwardFast,
        leftTopBack = frequencies.right.front.bottom.upBackwardFast,
        rightBotBack = frequencies.right.back.top.upBackward,
        rightTopBack = frequencies.right.back.bottom.upBackward,
    },
    flyBackwardDownRollLeft = {  
        leftBotFront = frequencies.left.front.top.downBackwardFast,
        leftTopFront = frequencies.left.front.bottom.downBackwardFast,
        rightBotFront = frequencies.left.back.top.downBackward,
        rightTopFront = frequencies.left.back.bottom.downBackward,
        leftBotBack = frequencies.right.front.top.downBackwardFast,
        leftTopBack = frequencies.right.front.bottom.downBackwardFast,
        rightBotBack = frequencies.right.back.top.downBackward,
        rightTopBack = frequencies.right.back.bottom.downBackward,
    },
    flyBackwardDownRollRight = {  
        leftBotFront = frequencies.left.front.top.downBackward,
        leftTopFront = frequencies.left.front.bottom.downBackward,
        rightBotFront = frequencies.left.back.top.downBackwardFast,
        rightTopFront = frequencies.left.back.bottom.downBackwardFast,
        leftBotBack = frequencies.right.front.top.downBackward,
        leftTopBack = frequencies.right.front.bottom.downBackward,
        rightBotBack = frequencies.right.back.top.downBackwardFast,
        rightTopBack = frequencies.right.back.bottom.downBackwardFast,
    },
    flyForwardUp = {  
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.upForward,
        leftTopBack = frequencies.left.back.top.upForward,
        leftBotBack = frequencies.left.back.bottom.upForward,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.upForward,
        rightTopBack = frequencies.right.back.top.upForward,
        rightBotBack = frequencies.right.back.bottom.upForward,
    },
    flyForwardDown = {  
        leftTopFront = frequencies.left.front.top.downForward,
        leftBotFront = frequencies.left.front.bottom.downForward,
        leftTopBack = frequencies.left.back.top.downForward,
        leftBotBack = frequencies.left.back.bottom.downForward,
        rightTopFront = frequencies.right.front.top.downForward,
        rightBotFront = frequencies.right.front.bottom.downForward,
        rightTopBack = frequencies.right.back.top.downForward,
        rightBotBack = frequencies.right.back.bottom.downForward,
    },
    flyBackwardUp = {  
        leftTopFront = frequencies.left.front.top.upBackward,
        leftBotFront = frequencies.left.front.bottom.upBackward,
        leftTopBack = frequencies.left.back.top.upBackward,
        leftBotBack = frequencies.left.back.bottom.upBackward,
        rightTopFront = frequencies.right.front.top.upBackward,
        rightBotFront = frequencies.right.front.bottom.upBackward,
        rightTopBack = frequencies.right.back.top.upBackward,
        rightBotBack = frequencies.right.back.bottom.upBackward,
    },
    flyBackwardDown = {  
        leftTopFront = frequencies.left.front.top.downBackward,
        leftBotFront = frequencies.left.front.bottom.downBackward,
        leftTopBack = frequencies.left.back.top.downBackward,
        leftBotBack = frequencies.left.back.bottom.downBackward,
        rightTopFront = frequencies.right.front.top.downBackward,
        rightBotFront = frequencies.right.front.bottom.downBackward,
        rightTopBack = frequencies.right.back.top.downBackward,
        rightBotBack = frequencies.right.back.bottom.downBackward,
    },
    flyForwardYawLeft = {  
        leftTopFront = frequencies.left.front.top.forward,
        leftBotFront = frequencies.left.front.bottom.forward,
        leftTopBack = frequencies.left.back.top.forward,
        leftBotBack = frequencies.left.back.bottom.forward,
        rightTopFront = frequencies.right.front.top.forwardFast,
        rightBotFront = frequencies.right.front.bottom.forwardFast,
        rightTopBack = frequencies.right.back.top.forwardFast,
        rightBotBack = frequencies.right.back.bottom.forwardFast,
    },
    flyForwardYawRight = {  
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.forwardFast,
        leftTopBack = frequencies.left.back.top.forward,
        leftBotBack = frequencies.left.back.bottom.forwardFast,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.forward,
        rightTopBack = frequencies.right.back.top.forward,
        rightBotBack = frequencies.right.back.bottom.forward,
    },
    flyBackwardYawLeft = {  
        leftTopFront = frequencies.left.front.top.backwardFast,
        leftBotFront = frequencies.left.front.bottom.backwardFast,
        leftTopBack = frequencies.left.back.top.backwardFast,
        leftBotBack = frequencies.left.back.bottom.backwardFast,
        rightTopFront = frequencies.right.front.top.backward,
        rightBotFront = frequencies.right.front.bottom.backward,
        rightTopBack = frequencies.right.back.top.backward,
        rightBotBack = frequencies.right.back.bottom.backward,
    },
    flyBackwardYawRight = {
        leftTopFront = frequencies.left.front.top.backward,
        leftBotFront = frequencies.left.front.bottom.backward,
        leftTopBack = frequencies.left.back.top.backward,
        leftBotBack = frequencies.left.back.bottom.backward,
        rightTopFront = frequencies.right.front.top.backwardFast,
        rightBotFront = frequencies.right.front.bottom.backwardFast,
        rightTopBack = frequencies.right.back.top.backwardFast,
        rightBotBack = frequencies.right.back.bottom.backwardFast,
    },
    flyForwardPitchUp = {  
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.upForward,
        leftTopBack = frequencies.left.back.top.downForward,
        leftBotBack = frequencies.left.back.bottom.downForward,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.upForward,
        rightTopBack = frequencies.right.back.top.downForward,
        rightBotBack = frequencies.right.back.bottom.downForward,
    },
    flyForwardPitchDown = {  
        leftTopFront = frequencies.left.front.top.downForward,
        leftBotFront = frequencies.left.front.bottom.downForward,
        leftTopBack = frequencies.left.back.top.upForward,
        leftBotBack = frequencies.left.back.bottom.upForward,
        rightTopFront = frequencies.right.front.top.downForward,
        rightBotFront = frequencies.right.front.bottom.downForward,
        rightTopBack = frequencies.right.back.top.upForward,
        rightBotBack = frequencies.right.back.bottom.upForward,
    },
    flyBackwardPitchUp = {  
        leftTopFront = frequencies.left.front.top.upBackward,
        leftBotFront = frequencies.left.front.bottom.upBackward,
        leftTopBack = frequencies.left.back.top.downBackward,
        leftBotBack = frequencies.left.back.bottom.downBackward,
        rightTopFront = frequencies.right.front.top.upBackward,
        rightBotFront = frequencies.right.front.bottom.upBackward,
        rightTopBack = frequencies.right.back.top.downBackward,
        rightBotBack = frequencies.right.back.bottom.downBackward,
    },
    flyBackwardPitchDown = { 
        leftTopFront = frequencies.left.front.top.downBackward,
        leftBotFront = frequencies.left.front.bottom.downBackward,
        leftTopBack = frequencies.left.back.top.upBackward,
        leftBotBack = frequencies.left.back.bottom.upBackward,
        rightTopFront = frequencies.right.front.top.downBackward,
        rightBotFront = frequencies.right.front.bottom.downBackward,
        rightTopBack = frequencies.right.back.top.upBackward,
        rightBotBack = frequencies.right.back.bottom.upBackward,
    },
    flyForwardRollLeft = {  
        leftTopFront = frequencies.left.front.top.downForward,
        leftBotFront = frequencies.left.front.bottom.downForward,
        leftTopBack = frequencies.left.back.top.downForward,
        leftBotBack = frequencies.left.back.bottom.downForward,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.upForward,
        rightTopBack = frequencies.right.back.top.upForward,
        rightBotBack = frequencies.right.back.bottom.upForward,
    },
    flyForwardRollRight = {  
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.upForward,
        leftTopBack = frequencies.left.back.top.upForward,
        leftBotBack = frequencies.left.back.bottom.upForward,
        rightTopFront = frequencies.right.front.top.downForward,
        rightBotFront = frequencies.right.front.bottom.downForward,
        rightTopBack = frequencies.right.back.top.downForward,
        rightBotBack = frequencies.right.back.bottom.downForward,
    },
    flyBackwardRollLeft = {  
        leftTopFront = frequencies.left.front.top.downBackward,
        leftBotFront = frequencies.left.front.bottom.downBackward,
        leftTopBack = frequencies.left.back.top.downBackward,
        leftBotBack = frequencies.left.back.bottom.downBackward,
        rightTopFront = frequencies.right.front.top.upBackward,
        rightBotFront = frequencies.right.front.bottom.upBackward,
        rightTopBack = frequencies.right.back.top.upBackward,
        rightBotBack = frequencies.right.back.bottom.upBackward,
    },
    flyBackwardRollRight = {  
        leftTopFront = frequencies.left.front.top.upBackward,
        leftBotFront = frequencies.left.front.bottom.upBackward,
        leftTopBack = frequencies.left.back.top.upBackward,
        leftBotBack = frequencies.left.back.bottom.upBackward,
        rightTopFront = frequencies.right.front.top.downBackward,
        rightBotFront = frequencies.right.front.bottom.downBackward,
        rightTopBack = frequencies.right.back.top.downBackward,
        rightBotBack = frequencies.right.back.bottom.downBackward,
    },
    flyUpYawLeft = {  
        leftTopFront = frequencies.left.front.top.upBackward,
        leftBotFront = frequencies.left.front.bottom.upBackward,
        leftTopBack = frequencies.left.back.top.upBackward,
        leftBotBack = frequencies.left.back.bottom.upBackward,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.upForward,
        rightTopBack = frequencies.right.back.top.upForward,
        rightBotBack = frequencies.right.back.bottom.upForward,
    },
    flyUpYawRight = {  
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.upForward,
        leftTopBack = frequencies.left.back.top.upForward,
        leftBotBack = frequencies.left.back.bottom.upForward,
        rightTopFront = frequencies.right.front.top.upBackward,
        rightBotFront = frequencies.right.front.bottom.upBackward,
        rightTopBack = frequencies.right.back.top.upBackward,
        rightBotBack = frequencies.right.back.bottom.upBackward,
    },
    flyDownYawLeft = {  
        leftTopFront = frequencies.left.front.top.downBackward,
        leftBotFront = frequencies.left.front.bottom.downBackward,
        leftTopBack = frequencies.left.back.top.downBackward,
        leftBotBack = frequencies.left.back.bottom.downBackward,
        rightTopFront = frequencies.right.front.top.downForward,
        rightBotFront = frequencies.right.front.bottom.downForward,
        rightTopBack = frequencies.right.back.top.downForward,
        rightBotBack = frequencies.right.back.bottom.downForward,
    },
    flyDownYawRight = {  
        leftTopFront = frequencies.left.front.top.downForward,
        leftBotFront = frequencies.left.front.bottom.downForward,
        leftTopBack = frequencies.left.back.top.downForward,
        leftBotBack = frequencies.left.back.bottom.downForward,
        rightTopFront = frequencies.right.front.top.downBackward,
        rightBotFront = frequencies.right.front.bottom.downBackward,
        rightTopBack = frequencies.right.back.top.downBackward,
        rightBotBack = frequencies.right.back.bottom.downBackward,
    },
    flyUpPitchUp = {  
        leftTopFront = frequencies.left.front.top.upForwardFast,
        leftBotFront = frequencies.left.front.bottom.upBackwardFast,
        leftTopBack = frequencies.left.back.top.backward,
        leftBotBack = frequencies.left.back.bottom.upForward,
        rightTopFront = frequencies.right.front.top.upForwardFast,
        rightBotFront = frequencies.right.front.bottom.upBackwardFast,
        rightTopBack = frequencies.right.back.top.backward,
        rightBotBack = frequencies.right.back.bottom.upForward,
    },
    flyUpPitchDown = {  
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.upBackward,
        leftTopBack = frequencies.left.back.top.upForwardFast,
        leftBotBack = frequencies.left.back.bottom.upBackwardFast,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.upBackward,
        rightTopBack = frequencies.right.back.top.upBackwardFast,
        rightBotBack = frequencies.right.back.bottom.upForwardFast,
    },
    flyDownPitchUp = {  
        leftTopFront = frequencies.left.front.top.downForward,
        leftBotFront = frequencies.left.front.bottom.downBackward,
        leftTopBack = frequencies.left.back.top.downForwardFast,
        leftBotBack = frequencies.left.back.bottom.downBackwardFast,
        rightTopFront = frequencies.right.front.top.downForward,
        rightBotFront = frequencies.right.front.bottom.downBackward,
        rightTopBack = frequencies.right.back.top.downBackwardFast,
        rightBotBack = frequencies.right.back.bottom.downForwardFast,
    },
    flyDownPitchDown = {  
        leftTopFront = frequencies.left.front.top.downForwardFast,
        leftBotFront = frequencies.left.front.bottom.downBackwardFast,
        leftTopBack = frequencies.left.back.top.downForward,
        leftBotBack = frequencies.left.back.bottom.downBackward,
        rightTopFront = frequencies.right.front.top.downForwardFast,
        rightBotFront = frequencies.right.front.bottom.downBackwardFast,
        rightTopBack = frequencies.right.back.top.downBackward,
        rightBotBack = frequencies.right.back.bottom.downForward,
    },
    flyUpRollLeft = {  
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.upBackward,
        leftTopBack = frequencies.left.back.top.upForward,
        leftBotBack = frequencies.left.back.bottom.upBackward,
        rightTopFront = frequencies.right.front.top.upForwardFast,
        rightBotFront = frequencies.right.front.bottom.upBackwardFast,
        rightTopBack = frequencies.right.back.top.upBackwardFast,
        rightBotBack = frequencies.right.back.bottom.upForwardFast,
    },
    flyUpRollRight = {  
        leftTopFront = frequencies.left.front.top.upForwardFast,
        leftBotFront = frequencies.left.front.bottom.upBackwardFast,
        leftTopBack = frequencies.left.back.top.upForwardFast,
        leftBotBack = frequencies.left.back.bottom.upBackwardFast,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.upBackward,
        rightTopBack = frequencies.right.back.top.upBackward,
        rightBotBack = frequencies.right.back.bottom.upForward,
    },
    flyDownRollLeft = {  
        leftTopFront = frequencies.left.front.top.downForwardFast,
        leftBotFront = frequencies.left.front.bottom.downBackwardFast,
        leftTopBack = frequencies.left.back.top.downForwardFast,
        leftBotBack = frequencies.left.back.bottom.downBackwardFast,
        rightTopFront = frequencies.right.front.top.downForward,
        rightBotFront = frequencies.right.front.bottom.downBackward,
        rightTopBack = frequencies.right.back.top.downBackward,
        rightBotBack = frequencies.right.back.bottom.downForward,
    },
    flyDownRollRight = {  
        leftTopFront = frequencies.left.front.top.downForward,
        leftBotFront = frequencies.left.front.bottom.downBackward,
        leftTopBack = frequencies.left.back.top.downForward,
        leftBotBack = frequencies.left.back.bottom.downBackward,
        rightTopFront = frequencies.right.front.top.downForwardFast,
        rightBotFront = frequencies.right.front.bottom.downBackwardFast,
        rightTopBack = frequencies.right.back.top.downBackwardFast,
        rightBotBack = frequencies.right.back.bottom.downForwardFast,
    },
    flyForward = {  
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.forwardFast,
        leftTopBack = frequencies.left.back.top.forwardFast,
        leftBotBack = frequencies.left.back.bottom.forwardFast,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.forwardFast,
        rightTopBack = frequencies.right.back.top.forwardFast,
        rightBotBack = frequencies.right.back.bottom.forwardFast,
    },
    flyBackward = {  
        leftTopFront = frequencies.left.front.top.downForward,
        leftBotFront = frequencies.left.front.bottom.backward,
        leftTopBack = frequencies.left.back.top.backward,
        leftBotBack = frequencies.left.back.bottom.backwardFast,
        rightTopFront = frequencies.right.front.top.downBackward,
        rightBotFront = frequencies.right.front.bottom.backward,
        rightTopBack = frequencies.right.back.top.backward,
        rightBotBack = frequencies.right.back.bottom.backwardFast,
    },
    flyForwardFast = {  
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.forwardFast,
        leftTopBack = frequencies.left.back.top.forwardFast,
        leftBotBack = frequencies.left.back.bottom.forwardFast,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.forwardFast,
        rightTopBack = frequencies.right.back.top.forwardFast,
        rightBotBack = frequencies.right.back.bottom.forwardFast,
    },
    flyBackwardFast = {  
        leftTopFront = frequencies.left.front.top.downForward,
        leftBotFront = frequencies.left.front.bottom.backwardFast,
        leftTopBack = frequencies.left.back.top.backwardFast,
        leftBotBack = frequencies.left.back.bottom.backwardFast,
        rightTopFront = frequencies.right.front.top.downBackward,
        rightBotFront = frequencies.right.front.bottom.backwardFast,
        rightTopBack = frequencies.right.back.top.backwardFast,
        rightBotBack = frequencies.right.back.bottom.backwardFast,
    },
    flyUp = { 
        leftTopFront = frequencies.left.front.top.upBackward,
        leftBotFront = frequencies.left.front.bottom.upBackward,
        leftTopBack = frequencies.left.back.top.upBackwardFast,
        leftBotBack = frequencies.left.back.bottom.upForward,
        rightTopFront = frequencies.right.front.top.upBackward,
        rightBotFront = frequencies.right.front.bottom.upBackward,
        rightTopBack = frequencies.right.back.top.upBackwardFast,
        rightBotBack = frequencies.right.back.bottom.upForward,
    },
    flyDown = { 
        leftTopFront = frequencies.left.front.top.downForward,
        leftBotFront = frequencies.left.front.bottom.downBackward,
        leftTopBack = frequencies.left.back.top.downForward,
        leftBotBack = frequencies.left.back.bottom.downBackward,
        rightTopFront = frequencies.right.front.top.downForward,
        rightBotFront = frequencies.right.front.bottom.downBackward,
        rightTopBack = frequencies.right.back.top.downBackward,
        rightBotBack = frequencies.right.back.bottom.downForward,
    },
    flyUpFast = { 
        leftTopFront = frequencies.left.front.top.upForwardFast,
        leftBotFront = frequencies.left.front.bottom.upBackwardFast,
        leftTopBack = frequencies.left.back.top.upBackwardFast,
        leftBotBack = frequencies.left.back.bottom.upForwardFast,
        rightTopFront = frequencies.right.front.top.upForwardFast,
        rightBotFront = frequencies.right.front.bottom.upBackwardFast,
        rightTopBack = frequencies.right.back.top.upBackwardFast,
        rightBotBack = frequencies.right.back.bottom.upForwardFast,
    },
    flyDownFast = { 
        leftTopFront = frequencies.left.front.top.downForwardFast,
        leftBotFront = frequencies.left.front.bottom.downBackwardFast,
        leftTopBack = frequencies.left.back.top.downForwardFast,
        leftBotBack = frequencies.left.back.bottom.downBackwardFast,
        rightTopFront = frequencies.right.front.top.downForwardFast,
        rightBotFront = frequencies.right.front.bottom.downBackwardFast,
        rightTopBack = frequencies.right.back.top.downBackwardFast,
        rightBotBack = frequencies.right.back.bottom.downForwardFast,
    },
    yawLeft = {
        leftTopFront = frequencies.left.front.top.idleFlap,
        leftBotFront = frequencies.left.front.bottom.backward,
        leftTopBack = frequencies.left.back.top.idleFlap,
        leftBotBack = frequencies.left.back.bottom.backward,
        rightTopFront = frequencies.right.front.top.idleFlap,
        rightBotFront = frequencies.right.front.bottom.forward,
        rightTopBack = frequencies.right.back.top.idleFlap,
        rightBotBack = frequencies.right.back.bottom.forward,
    },
    yawRight = {
        leftTopFront = frequencies.left.front.top.idleFlap,
        leftBotFront = frequencies.left.front.bottom.forward,
        leftTopBack = frequencies.left.back.top.idleFlap,
        leftBotBack = frequencies.left.back.bottom.forward,
        rightTopFront = frequencies.right.front.top.idleFlap,
        rightBotFront = frequencies.right.front.bottom.backward,
        rightTopBack = frequencies.right.back.top.idleFlap,
        rightBotBack = frequencies.right.back.bottom.backward,
    },
    pitchUp = {
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.upBackward,
        leftTopBack = frequencies.left.back.top.downForward,
        leftBotBack = frequencies.left.back.bottom.downBackward,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.upBackward,
        rightTopBack = frequencies.right.back.top.downForward,
        rightBotBack = frequencies.right.back.bottom.downBackward,
    },
    pitchDown = {
        leftTopFront = frequencies.left.front.top.downForward,
        leftBotFront = frequencies.left.front.bottom.downBackward,
        leftTopBack = frequencies.left.back.top.upForward,
        leftBotBack = frequencies.left.back.bottom.upBackward,
        rightTopFront = frequencies.right.front.top.downForward,
        rightBotFront = frequencies.right.front.bottom.downBackward,
        rightTopBack = frequencies.right.back.top.upForward,
        rightBotBack = frequencies.right.back.bottom.upBackward,
    },
    rollLeft = {
        leftTopFront = frequencies.left.front.top.downBackward,
        leftBotFront = frequencies.left.front.bottom.downBackward,
        leftTopBack = frequencies.left.back.top.downBackward,
        leftBotBack = frequencies.left.back.bottom.downBackward,
        rightTopFront = frequencies.right.front.top.upForward,
        rightBotFront = frequencies.right.front.bottom.upForward,
        rightTopBack = frequencies.right.back.top.upForward,
        rightBotBack = frequencies.right.back.bottom.upForward,
    },
    rollRight = {
        leftTopFront = frequencies.left.front.top.upForward,
        leftBotFront = frequencies.left.front.bottom.upForward,
        leftTopBack = frequencies.left.back.top.upBackward,
        leftBotBack = frequencies.left.back.bottom.upBackward,
        rightTopFront = frequencies.right.front.top.downForward,
        rightBotFront = frequencies.right.front.bottom.downForward,
        rightTopBack = frequencies.right.back.top.downBackward,
        rightBotBack = frequencies.right.back.bottom.downBackward,
    },
    idleFlap = {
        leftTopFront = frequencies.left.front.top.idleFlap,
        leftBotFront = frequencies.left.front.bottom.idleFlap,
        leftTopBack = frequencies.left.back.top.idleFlap,
        leftBotBack = frequencies.left.back.bottom.idleFlap,
        rightTopFront = frequencies.right.front.top.idleFlap,
        rightBotFront = frequencies.right.front.bottom.idleFlap,
        rightTopBack = frequencies.right.back.top.idleFlap,
        rightBotBack = frequencies.right.back.bottom.idleFlap,
    },
}


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local allKeys = {
    qKey = { freq = "minecraft:kelp minecraft:quartz" , pressed = false },
    aKey = { freq = "minecraft:kelp minecraft:acacia_boat" , pressed = false },
    wKey = { freq = "minecraft:kelp minecraft:warped_button" , pressed = false },
    sKey = { freq = "minecraft:kelp minecraft:saddle" , pressed = false },
    eKey = { freq = "minecraft:kelp minecraft:egg" , pressed = false },
    rKey = { freq = "minecraft:kelp minecraft:rabbit" , pressed = false },
    dKey = { freq = "minecraft:kelp minecraft:dandelion" , pressed = false },
    fKey = { freq = "minecraft:kelp minecraft:feather" , pressed = false },
    cKey = { freq = "minecraft:kelp minecraft:cactus" , pressed = false },
    shiftKey = { freq = "minecraft:kelp minecraft:shield" , pressed = false },
    ctrlKey = { freq = "minecraft:kelp minecraft:coal_block" , pressed = false },
    spaceKey = { freq = "minecraft:kelp minecraft:spectral_arrow" , pressed = false },
    tabKey = { freq = "minecraft:kelp minecraft:tadpole_bucket" , pressed = false }
}


local flyUp = { name = "flyUp" , keys = { allKeys.spaceKey } }
local flyDown = { name = "flyDown" , keys = { allKeys.ctrlKey } }
local flyUpFast = { name = "flyUpFast" , keys = { allKeys.spaceKey, allKeys.shiftKey } }
local flyDownFast = { name = "flyDownFast" , keys = { allKeys.ctrlKey, allKeys.shiftKey } }
local flyForward = { name = "flyForward" , keys = { allKeys.qKey } }
local flyForwardFast = { name = "flyForwardFast" , keys = { allKeys.qKey, allKeys.shiftKey } }
local flyBackward = { name = "flyBackward" , keys = { allKeys.aKey } }
local flyBackwardFast  = { name = "flyBackwardFast" , keys = { allKeys.aKey, allKeys.shiftKey } }

local yawLeft = { name = "yawLeft" , keys = { allKeys.dKey } }
local yawRight = { name = "yawRight" , keys = { allKeys.fKey } }
local pitchUp = { name = "pitchUp" , keys = { allKeys.wKey } }
local pitchDown = { name = "pitchDown" , keys = { allKeys.sKey } }
local rollLeft = { name = "rollLeft" , keys = { allKeys.eKey } }
local rollRight = { name = "rollRight" , keys = { allKeys.rKey } }

--local glide = { name = "glide" , keys = { allKeys.shiftKey, allKeys.ctrlKey } }
--local glideYawLeft = { name = "glideYawLeft" , keys = { allKeys.shiftKey, allKeys.ctrlKey, allKeys.dKey } }
--local glideYawRight = { name = "glideYawRight" , keys = { allKeys.shiftKey, allKeys.ctrlKey, allKeys.fKey } }
--local glidePitchUp = { name = "glidePitchUp" , keys = { allKeys.shiftKey, allKeys.ctrlKey, allKeys.wKey } }
--local glidePitchDown = { name = "glidePitchDown" , keys = { allKeys.shiftKey, allKeys.ctrlKey, allKeys.sKey } }
--local glideRollLeft = { name = "glideRollLeft" , keys = { allKeys.shiftKey, allKeys.ctrlKey, allKeys.eKey  } }
--local glideRollRight = { name = "glideRollRight" , keys = { allKeys.shiftKey, allKeys.ctrlKey, allKeys.rKey } }

--local brake = { name = "brake" , keys = { allKeys.qKey, allKeys.aKey } }
--local wingsToggle = { name = "wingsToggle" , keys = { allKeys.cKey } }

local flyForwardUp = { name = "flyForwardUp" , keys = { allKeys.qKey , allKeys.spaceKey } }
local flyForwardDown = { name = "flyForwardDown" , keys = { allKeys.qKey , allKeys.ctrlKey } }
local flyBackwardUp = { name = "flyBackwardUp" , keys = { allKeys.aKey, allKeys.spaceKey } }
local flyBackwardDown = { name = "flyBackwardDown" , keys = { allKeys.aKey, allKeys.ctrlKey } }

local flyUpYawLeft = { name = "flyUpYawLeft" , keys = { allKeys.spaceKey , allKeys.dKey } }
local flyUpYawRight = { name = "flyUpYawRight" , keys = { allKeys.spaceKey , allKeys.fKey} }
local flyDownYawLeft = { name = "flyDownYawLeft" , keys = { allKeys.ctrlKey , allKeys.dKey } }
local flyDownYawRight = { name = "flyDownYawRight" , keys = { allKeys.ctrlKey , allKeys.fKey} }
local flyUpPitchUp = { name = "flyUpPitchUp" , keys = { allKeys.spaceKey , allKeys.wKey } }
local flyUpPitchDown = { name = "flyUpPitchDown" , keys = { allKeys.spaceKey , allKeys.sKey } }
local flyDownPitchUp = { name = "flyDownPitchUp" , keys = { allKeys.ctrlKey , allKeys.wKey } }
local flyDownPitchDown = { name = "flyDownPitchDown" , keys = { allKeys.ctrlKey , allKeys.sKey } }
local flyUpRollLeft = { name = "flyUpRollLeft" , keys = { allKeys.spaceKey , allKeys.eKey } }
local flyUpRollRight = { name = "flyUpRollRight" , keys = { allKeys.spaceKey , allKeys.rKey } }
local flyDownRollLeft = { name = "flyDownRollLeft" , keys = { allKeys.ctrlKey , allKeys.eKey} }
local flyDownRollRight = { name = "flyDownRollRight" , keys = { allKeys.ctrlKey , allKeys.rKey} }

local flyForwardUpYawLeft = { name = "flyForwardUpYawLeft" , keys = { allKeys.qKey , allKeys.spaceKey, allKeys.dKey } }
local flyForwardUpYawRight = { name = "flyForwardUpYawRight" , keys = { allKeys.qKey , allKeys.spaceKey, allKeys.fKey } }
local flyForwardDownYawLeft = { name = "flyForwardDownYawLeft" , keys = { allKeys.qKey , allKeys.ctrlKey, allKeys.fKey } }
local flyForwardDownYawRight = { name = "flyForwardDownYawRight" , keys = { allKeys.qKey , allKeys.ctrlKey, allKeys.dKey } }
local flyBackwardUpYawLeft = { name = "flyBackwardUpYawLeft" , keys = { allKeys.aKey, allKeys.spaceKey, allKeys.dKey } }
local flyBackwardUpYawRight = { name = "flyBackwardUpYawRight" , keys = { allKeys.aKey, allKeys.spaceKey, allKeys.fKey } }
local flyBackwardDownYawLeft = { name = "flyBackwardDownYawLeft" , keys = { allKeys.aKey, allKeys.ctrlKey, allKeys.fKey } }
local flyBackwardDownYawRight = { name = "flyBackwardDownYawRight" , keys = { allKeys.aKey, allKeys.ctrlKey, allKeys.dKey } }
local flyForwardUpPitchUp = { name = "flyForwardUpPitchUp" , keys = { allKeys.qKey , allKeys.spaceKey, allKeys.wKey } }
local flyForwardUpPitchDown = { name = "flyForwardUpPitchDown" , keys = { allKeys.qKey , allKeys.spaceKey, allKeys.sKey } }
local flyForwardDownPitchUp = { name = "flyForwardDownPitchUp" , keys = { allKeys.qKey , allKeys.ctrlKey, allKeys.wKey } }
local flyForwardDownPitchDown = { name = "flyForwardDownPitchDown" , keys = { allKeys.qKey , allKeys.ctrlKey, allKeys.sKey } }
local flyBackwardUpPitchUp = { name = "flyBackwardUpPitchUp" , keys = { allKeys.aKey, allKeys.spaceKey, allKeys.wKey } }
local flyBackwardUpPitchDown = { name = "flyBackwardUpPitchDown" , keys = { allKeys.aKey, allKeys.spaceKey, allKeys.sKey } }
local flyBackwardDownPitchUp = { name = "flyBackwardDownPitchUp" , keys = { allKeys.aKey, allKeys.ctrlKey, allKeys.wKey } }
local flyBackwardDownPitchDown = { name = "flyBackwardDownPitchDown" , keys = { allKeys.aKey, allKeys.ctrlKey, allKeys.sKey } }
local flyForwardUpRollLeft = { name = "flyForwardUpRollLeft" , keys = { allKeys.qKey , allKeys.spaceKey, allKeys.eKey } }
local flyForwardUpRollRight = { name = "flyForwardUpRollRight" , keys = { allKeys.qKey , allKeys.spaceKey, allKeys.rKey } }
local flyForwardDownRollLeft = { name = "flyForwardDownRollLeft" , keys = { allKeys.qKey , allKeys.ctrlKey, allKeys.eKey } }
local flyForwardDownRollRight = { name = "flyForwardDownRollRight" , keys = { allKeys.qKey , allKeys.ctrlKey, allKeys.rKey } }
local flyBackwardUpRollLeft = { name = "flyBackwardUpRollLeft" , keys = { allKeys.aKey, allKeys.spaceKey, allKeys.eKey } }
local flyBackwardUpRollRight = { name = "flyBackwardUpRollRight" , keys = { allKeys.aKey, allKeys.spaceKey, allKeys.rKey } }
local flyBackwardDownRollLeft = { name = "flyBackwardDownRollLeft" , keys = { allKeys.aKey, allKeys.ctrlKey, allKeys.eKey } }
local flyBackwardDownRollRight = { name = "flyBackwardDownRollRight" , keys = { allKeys.aKey, allKeys.ctrlKey, allKeys.rKey } }

local flyForwardYawLeft = { name = "flyForwardYawLeft" , keys = { allKeys.qKey, allKeys.dKey } }
local flyForwardYawRight = { name = "flyForwardYawRight" , keys = { allKeys.qKey, allKeys.fKey } }
local flyBackwardYawLeft = { name = "flyBackwardYawLeft" , keys = { allKeys.aKey, allKeys.dKey } }
local flyBackwardYawRight = { name = "flyBackwardYawRight" , keys = { allKeys.aKey, allKeys.fKey } }
local flyForwardPitchUp = { name = "flyForwardPitchUp" , keys = { allKeys.qKey, allKeys.wKey } }
local flyForwardPitchDown = { name = "flyForwardPitchDown" , keys = { allKeys.qKey, allKeys.sKey } }
local flyBackwardPitchUp = { name = "flyBackwardPitchUp" , keys = { allKeys.aKey, allKeys.wKey } }
local flyBackwardPitchDown = { name = "flyBackwardPitchDown" , keys = { allKeys.aKey, allKeys.sKey } }
local flyForwardRollLeft = { name = "flyForwardRollLeft" , keys = { allKeys.qKey, allKeys.eKey } }
local flyForwardRollRight = { name = "flyForwardRollRight" , keys = { allKeys.qKey, allKeys.rKey } }
local flyBackwardRollLeft = { name = "flyBackwardRollLeft" , keys = { allKeys.aKey, allKeys.eKey } }
local flyBackwardRollRight = { name = "flyBackwardRollRight" , keys = { allKeys.aKey, allKeys.rKey } }


local allMotions = { -- more keys to less keys
    --wingsToggle,
    --glideYawLeft,
    --glideYawRight,
    --glidePitchUp,
    --glidePitchDown,
    --glideRollLeft,
    --glideRollRight,
    --glide,
    flyForwardUpYawLeft,
    flyForwardUpYawRight,
    flyForwardDownYawLeft,
    flyForwardDownYawRight,
    flyBackwardUpYawLeft,
    flyBackwardUpYawRight,
    flyBackwardDownYawLeft,
    flyBackwardDownYawRight,
    flyForwardUpPitchUp,
    flyForwardUpPitchDown,
    flyForwardDownPitchUp,
    flyForwardDownPitchDown,
    flyBackwardUpPitchUp,
    flyBackwardUpPitchDown,
    flyBackwardDownPitchUp,
    flyBackwardDownPitchDown,
    flyForwardUpRollLeft,
    flyForwardUpRollRight,
    flyForwardDownRollLeft,
    flyForwardDownRollRight,
    flyBackwardUpRollLeft,
    flyBackwardUpRollRight,
    flyBackwardDownRollLeft,
    flyBackwardDownRollRight,
    flyForwardUp,
    flyForwardDown,
    flyBackwardUp,
    flyBackwardDown,
    flyForwardYawLeft,
    flyForwardYawRight,
    flyBackwardYawLeft,
    flyBackwardYawRight,
    flyForwardPitchUp,
    flyForwardPitchDown,
    flyBackwardPitchUp,
    flyBackwardPitchDown,
    flyForwardRollLeft,
    flyForwardRollRight,
    flyBackwardRollLeft,
    flyBackwardRollRight,
    flyUpYawLeft,
    flyUpYawRight,
    flyDownYawLeft,
    flyDownYawRight,
    flyUpPitchUp,
    flyUpPitchDown,
    flyDownPitchUp,
    flyDownPitchDown,
    flyUpRollLeft,
    flyUpRollRight,
    flyDownRollLeft,
    flyDownRollRight,
    --brake,
    flyForwardFast,
    flyBackwardFast,
    flyUpFast,
    flyDownFast,
    flyForward,
    flyBackward,
    flyUp,
    flyDown,
    yawLeft,
    yawRight,
    pitchUp,
    pitchDown,
    rollLeft,
    rollRight
}

local previousCPressed = false
local cPressed = false
local wingsShouldBeFolded = false
local wingsFolded = false
local receivedDatas = nil


local function import()
    local datas = fs.open("datas.txt", "r")
    if datas == nil then return end
    receivedDatas = textutils.unserialize(datas.readAll())
    datas.close()
end
local function export()
    local datas = {wingsFolded = wingsFolded, wingsShouldBeFolded = wingsShouldBeFolded}
    local file = fs.open("datas.txt", "w")
    file.write(textutils.serialize(datas))
    file.close()
end
local function start()
    import()
    if receivedDatas ~= nil then
        wingsFolded = receivedDatas.wingsFolded
        wingsShouldBeFolded = receivedDatas.wingsShouldBeFolded
    else
        export()
    end
end

local function updateKeysPressed()
    local getLinksFuncs = {}
    for keyName, key in pairs(allKeys) do
        table.insert(getLinksFuncs , function() 
            local id = keyName
            while true do
                local freq1, freq2 = string.match(allKeys[id].freq, "(.+) (.+)")
                local signalValue = linkBridge.getLinkSignal(freq1, freq2)
                if signalValue > 0 then
                    allKeys[id].pressed = true
                else
                    allKeys[id].pressed = false
                end
                sleep(0.05)
            end
        end)
    end
    parallel.waitForAll(table.unpack(getLinksFuncs))
end
local function directionSelectionController()
    local noKeyPressed = true
    for i, motion in ipairs(allMotions) do
        local shouldExecuteMotion = true
        for keyName, key in pairs(motion.keys) do
            if key.pressed == false then
                shouldExecuteMotion = false
                break
            end
        end
        if shouldExecuteMotion then
            local motionFormula = motion.name
            currentMotion = flightMotions[motion.name]
            
            noKeyPressed = false
            break
        end
    end
    if noKeyPressed then
        local motionFormula = "idleFlap"
        currentMotion = flightMotions["idleFlap"]
    end
end

local function setFrequency(freqs, turnOn)
    local strength = 0
    if turnOn then strength = 15 end
    
    local funcs = {}
    for i, freqPair in pairs(freqs) do
        for j, freq in pairs(freqPair) do
            table.insert(funcs, 
            function()
                linkBridge.sendLinkSignal(freq[1], freq[2], strength)
            end)
        end
    end
    parallel.waitForAll(table.unpack(funcs))
end


local function wingsToggleUpdate()
    local freq1, freq2 = string.match(allKeys.cKey.freq, "(.+) (.+)")

    while true do
        cPressed = linkBridge.getLinkSignal(freq1, freq2)
        
        if cPressed ~= previousCPressed then
            if cPressed == 15 then
                if wingsShouldBeFolded then
                    wingsShouldBeFolded = false
                else
                    wingsShouldBeFolded = true
                end
                export()
            end
            previousCPressed = cPressed
        end
        sleep(0.05)
    end
end
local function foldWings()
    for i = 1, 16 do
        if wingsShouldBeFolded ~= wingsFolded then break end
        linkBridge.sendLinkSignal("synaxis:dynamic_joint_motor" , "minecraft:scaffolding", i - 1)
    end
end
local function unfoldWings()
    for i = 1, 16 do
        if wingsShouldBeFolded ~= wingsFolded then break end
        linkBridge.sendLinkSignal("synaxis:dynamic_joint_motor" , "minecraft:scaffolding", 16 - (i + 1))
    end
end

local function flightController()
    while true do
        local currentActivatedFreqs = {}

        if wingsShouldBeFolded ~= wingsFolded then
            wingsFolded = wingsShouldBeFolded
            export()
            if wingsShouldBeFolded then
                for _, v in pairs(flightMotions.wingsFold) do
                    table.insert(currentActivatedFreqs, v)
                end
                foldWings()
                setFrequency(currentActivatedFreqs, true)
                setFrequency(currentActivatedFreqs, false)
            else
                unfoldWings()
            end
        end
        
        if wingsFolded == false then
            currentActivatedFreqs = {}
    
            directionSelectionController()
    
            for _, v in pairs(currentMotion) do
                table.insert(currentActivatedFreqs, v)
            end
    
            setFrequency(currentActivatedFreqs, true)
            setFrequency(currentActivatedFreqs, false)
        else
            sleep(0.05)
        end
    end
end

term.clear()
term.setCursorPos(1,1)
print(os.date())
sleep(0.1)

start()
parallel.waitForAny(updateKeysPressed , wingsToggleUpdate, flightController) -- 