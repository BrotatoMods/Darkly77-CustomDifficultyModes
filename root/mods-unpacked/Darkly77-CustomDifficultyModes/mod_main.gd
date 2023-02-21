extends Node

const MOD_DIR = "Darkly77-CustomDifficultyModes/"
const DIFFTEST_LOG = "Darkly77-CustomDifficultyModes"

var dir = ""
var ext_dir = ""


func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", DIFFTEST_LOG)
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	# ext_dir = dir + "extensions/"

	# Add translations
	modLoader.add_translation_from_resource(dir + "translations/mod_customdifficultymodes_text.en.translation")


func _ready():
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	# Difficulties
	ContentLoader.load_data(dir + "content_data/difficulties.tres", DIFFTEST_LOG)

	ModLoaderUtils.log_info("Done", DIFFTEST_LOG)
