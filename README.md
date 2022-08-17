# gltun
Graphics library tunneling

## The Idea
In the current state of virtualization, when GPUs are needed, they are completely passed through to the client, as any other PCIe device. This means that the host and the client can not use the GPU at the same time, and this leads to clunky virtualization setups when people want to use Linux, but still want to play a couple games that don't run over Proton/Wine yet.

However, there is a flaw in the current solution: it does not exploit layers of abstraction well enough. The goal of the user is to run a game, which uses some sort of graphics library, not to run the graphics card driver which implements said library. Therefore, instead of needing to pass things through at the PCIe layer, we can move up to the Vulkan/OpenGL/etc. layer. This theoretically allows us to share the processing power of a GPU between a client and a host, since graphics libraries are built to be able to be used by multiple applications all at once.

## The Execution
 1. Create an RPC protocol for Vulkan between the client and the host
 2. Write an agent for the host
 3. Write a driver for the client
 4. Repeat for OpenGL, etc.

## The Current Status
Nothing usable. Check back later!
