#include <stdio.h>
#include <vulkan/vulkan.h>

VKAPI_ATTR PFN_vkVoidFunction VKAPI_CALL vk_icdGetInstanceProcAddr(VkInstance instance, const char* pName)
{
	printf("[GLTUN] asked for: %s\n", pName);
	return NULL;
}
