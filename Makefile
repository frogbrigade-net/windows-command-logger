# Makefile
# The FROG Brigade dot NET
# Ver.1.0.0, 2021-12-03

BUILD_DIR := build

SOURCE_DOCS := README.md LICENSE
SOURCE_MODS := $(wildcard modules/*.bat)

TARGET := windows-command-logger.zip
TARGET_DOCS := $(addprefix $(BUILD_DIR)/,$(SOURCE_DOCS))
TARGET_MODS := $(patsubst modules/%.bat,$(BUILD_DIR)/modules/%.bat,$(SOURCE_MODS))

all: $(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/$(TARGET): $(TARGET_DOCS) $(TARGET_MODS)
	@cd $(BUILD_DIR) && zip -vr $(TARGET) .

$(TARGET_DOCS): $(SOURCE_DOCS) | $(BUILD_DIR)
	@cp $^ $(BUILD_DIR)

$(TARGET_MODS): $(SOURCE_MODS) | $(BUILD_DIR)/modules
	@cp $^ $(BUILD_DIR)/modules

$(BUILD_DIR) $(BUILD_DIR)/modules:
	@mkdir -p $@

clean:
	@rm -rf $(BUILD_DIR)
