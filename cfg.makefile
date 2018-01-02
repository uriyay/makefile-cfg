define countWords
	$(shell echo $(1) | wc -w)
endef

define randomElement
	$(eval wordList := $(1))
	$(eval lowLimit := 1)
	$(eval highLimit := $(call countWords, $(wordList)))
	$(eval index := $(shell bash -c 'echo $$[$(lowLimit) + ($$RANDOM) % ($(highLimit) - $(lowLimit))] '))
	echo $(index)
	echo $(word $(index), $(wordList))
endef

define randomRule
	$(eval wordList := $(1))
	$(eval lowLimit := 1)
	$(eval highLimit := $(call countWords, $(wordList)))
	$(eval index := $(shell bash -c 'echo $$[$(lowLimit) + ($$RANDOM) % ($(highLimit) - $(lowLimit))] '))
	echo $(index)
	echo $(word $(index), $(wordList))
endef

define echoList
	echo $(1)
endef

all: S

S: W1

W1: W2
	@echo -n 0
	@echo countWords
	@echo $(call countWords,"ho ho ho")
	@echo echoList
	@echo $(call echoList, hello world wow ok)
	@echo randomElement
	@echo $(call randomElement,hello world wow)

W2: 
	echo -n 1
