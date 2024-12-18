CC = gcc
CFLAGS = -Wall -g
INCLUDES = C:/GL/SDLbin/include

L_PATH = C:/GL/SDLbin/lib/x86
L_LIBS = -lSDL2main -lSDL2

SRC_DIR = src
OBJ_DIR = $(SRC_DIR)/obj

SRCS = $(wildcard $(SRC_DIR)/*.c)
HDRS = $(wildcard $(SRC_DIR)/*.h)
OBJS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))

TARGET = tdg

all: $(OBJ_DIR) $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) -L $(L_PATH) $(L_LIBS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I $(INCLUDES) -c $< -o $@

clean:
	rm -f $(TARGET)
	rm -rf $(OBJ_DIR)/*.o

.PHONY: all clean

