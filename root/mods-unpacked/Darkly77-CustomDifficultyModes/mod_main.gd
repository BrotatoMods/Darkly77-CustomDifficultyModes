extends Node

const MOD_DIR = "Darkly77-CustomDifficultyModes/"
const DIFFTEST_LOG = "Darkly77-CustomDifficultyModes"

var dir = ""
var ext_dir = ""


func _init(modLoader = ModLoader):
	return
	ModLoaderLog.info("Init", DIFFTEST_LOG)
	dir = ModLoaderMod.get_unpacked_dir() + MOD_DIR
	# ext_dir = dir + "extensions/"

	# Add translations
	ModLoaderMod.add_translation(dir + "translations/mod_customdifficultymodes_text.en.translation")


func _ready():
	return
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	# Add content
	ContentLoader.load_data(dir + "content_data/items.tres", DIFFTEST_LOG)
	ContentLoader.load_data(dir + "content_data/difficulties.tres", DIFFTEST_LOG)

	ModLoaderLog.info("Done", DIFFTEST_LOG)
