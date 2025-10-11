CC := gcc
CFLAGS := -Wall -Wextra -std=c99 -g -MMD -MP

SRC := $(wildcard *.c)
OBJ := $(SRC:.c=.o)
DEPS := $(OBJ:.o=.d)
OUT := clox

all: $(OUT)

$(OUT): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

-include $(DEPS)

clean:
	rm -f $(OBJ) $(DEPS) $(OUT)

run: $(OUT)
	./$(OUT)

trace: CFLAGS += -DDEBUG_TRACE_EXECUTION
trace: clean all

.PHONY: all clean run

