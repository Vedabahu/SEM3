CC = gcc
CFLAGS = -O3
VPATH = src
OBJECTS = main.o searchRoutes.o complain.o bookBuses.o
TARGET = busTransitSystem.out

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

.PHONY : clean
clean:
	rm ./*.o $(TARGET)