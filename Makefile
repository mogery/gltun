# Thanks to Fayti1703 for the Makefile template

CFLAGS ::= -Wall -Wpedantic -Iinclude -std=c11 -fPIC

OBJS ::= obj/main.o

obj/%.o: src/%.c include/%.h $(prereq_c_all) $(prereq_c_headered)
	@mkdir -p $(@D)
	$(CC) -c -o $@ $< $(CFLAGS) $(COFLAGS) $(CADDFLAGS)

obj/%.o: src/%.c $(prereq_c_all) $(prereq_c_unheadered)
	@mkdir -p $(@D)
	$(CC) -c -o $@ $< $(CFLAGS) $(COFLAGS) $(CADDFLAGS)

define recipe_link
	$(CC) -o $@ $^ $(CFLAGS) $(CLFLAGS) $(CADDFLAGS) $(1)
endef

libgltun.so: $(OBJS)
	$(call recipe_link, -shared -Bsymbolic)

.PHONY: all clean vkinfo

all: libgltun.so

clean:
	rm -r libgltun.so obj/

vkinfo: libgltun.so
	VK_LOADER_DEBUG=all VK_DRIVER_FILES=$(realpath gltun.json) VK_ICD_FILENAMES=$(realpath gltun.json) vulkaninfo
