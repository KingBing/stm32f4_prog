CFLAGS=-g
MYCFLAGS=-Wl,-T./stm32.ld -nostartfiles -fno-common -O0 -g -mcpu=cortex-m3 -mthumb
myur_led.bin: myur_led.elf
	arm-none-eabi-objcopy -Obinary $< $@
myur_led.elf: myur_led.c
	arm-none-eabi-gcc $(MYCFLAGS) $(INC) -o $@ $< 

int.bin: int.elf
	arm-none-eabi-objcopy -O binary $< $@
int.elf: int.o
	arm-none-eabi-ld -Ttext 0x0 -o $@ $<
int.o: int.S
	arm-none-eabi-as -g -mcpu=cortex-m3 -mthumb -o $@ $<

myur.bin: myur.elf
	arm-none-eabi-objcopy -Obinary $< $@
myur.elf: myur.c
	arm-none-eabi-gcc $(MYCFLAGS) $(INC) -o $@ $< 

factorial.bin: factorial.elf
	arm-none-eabi-objcopy -O binary $< $@

factorial.elf: factorial.o
	arm-none-eabi-ld -Ttext 0x0 -o $@ $<
	
factorial.o: factorial.S
	arm-none-eabi-as -g -mcpu=cortex-m3 -mthumb -o $@ $<
	#arm-none-eabi-gcc $(CFLAGS) -mcpu=cortex-m3 -mthumb -nostartfiles -c hello.c

hello.bin: hello.elf
	arm-none-eabi-objcopy -O binary hello.elf hello.bin

hello.o: hello.c stm32.h
	arm-none-eabi-gcc $(CFLAGS) -mcpu=cortex-m3 -mthumb -nostartfiles -c hello.c

hello.elf: hello.o
	arm-none-eabi-ld -T stm32.ld -o hello.elf hello.o

mygpio_led.bin: mygpio_led.elf
	arm-none-eabi-objcopy -Obinary $< $@
mygpio_led.elf: mygpio_led.c
	arm-none-eabi-gcc $(MYCFLAGS) $(INC) -o $@ $< 
clean:
	rm -rf *.o *.bin *.elf
