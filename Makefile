CC = xelatex
SOURCE_DIR = src
BUILD_DIR = build
RESUME_DIR = $(SOURCE_DIR)/resume
CV_DIR = $(SOURCE_DIR)/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

.PHONY: build_dir
build_dir:
	@echo $(RESUME_DIR)
	@echo $(RESUME_SRCS)
	mkdir -p $(BUILD_DIR)

resume.pdf: $(SOURCE_DIR)/resume.tex $(RESUME_SRCS) build_dir
	$(CC) -output-directory=$(BUILD_DIR) $<

cv.pdf: $(SOURCE_DIR)/cv.tex $(CV_SRCS) build_dir
	$(CC) -output-directory=$(BUILD_DIR) $<

coverletter.pdf: $(SOURCE_DIR)/coverletter.tex build_dir
	$(CC) -output-directory=$(BUILD_DIR) $<

clean:
	rm -rf $(BUILD_DIR)/*.pdf
