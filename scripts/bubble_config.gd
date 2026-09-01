class_name BubbleConfig
extends RefCounted

## 岁家龙泡泡 — same grid as bubble-shooter, Arknights character palette.

const ROWS := 12
const COLS := 8
const INITIAL_ROWS := 5
const RADIUS := 16.0
const TOP_OFFSET := 18.0
const LAUNCH_SPEED := 480.0
const MIN_MATCH := 3

const LABELS: Array[String] = ["年", "夕", "令", "重", "黍"]
const TEXTURE_PATHS: Array[String] = [
	"res://assets/nian.png",
	"res://assets/dusk.png",
	"res://assets/ling.png",
	"res://assets/chongyue.png",
	"res://assets/shu.png",
]

static func row_step() -> float:
	return roundf(RADIUS * 1.73)

static func diameter() -> float:
	return RADIUS * 2.0

static func board_width() -> float:
	return diameter() * float(COLS) + RADIUS

static func board_height() -> float:
	return TOP_OFFSET + row_step() * float(ROWS + 1) + RADIUS

static func shooter_pos() -> Vector2:
	return Vector2(board_width() * 0.5, board_height() - RADIUS - 12.0)

# 年 / 夕 / 令 / 重 / 黍 (main hex from ArknightsBubbleShooter.tsx)
const PALETTE: Array[Color] = [
	Color(0.776, 0.157, 0.157),
	Color(0.149, 0.196, 0.220),
	Color(0.051, 0.278, 0.631),
	Color(0.102, 0.102, 0.180),
	Color(0.216, 0.278, 0.310),
]

const HIGHLIGHT: Array[Color] = [
	Color(0.937, 0.604, 0.604),
	Color(0.502, 0.871, 0.918),
	Color(0.565, 0.792, 0.976),
	Color(0.690, 0.745, 0.773),
	Color(0.812, 0.847, 0.863),
]

static func random_color_index(rng: RandomNumberGenerator) -> int:
	return rng.randi_range(0, PALETTE.size() - 1)

static func bubble_pos(row: int, col: int) -> Vector2:
	var x := RADIUS + float(col) * diameter() + (float(row % 2) * RADIUS)
	var y := TOP_OFFSET + RADIUS + float(row) * row_step()
	return Vector2(x, y)

static func color_for(idx: int) -> Color:
	return PALETTE[clampi(idx, 0, PALETTE.size() - 1)]

static func highlight_for(idx: int) -> Color:
	return HIGHLIGHT[clampi(idx, 0, HIGHLIGHT.size() - 1)]

static func label_for(idx: int) -> String:
	return LABELS[clampi(idx, 0, LABELS.size() - 1)]

static func texture_path(idx: int) -> String:
	return TEXTURE_PATHS[clampi(idx, 0, TEXTURE_PATHS.size() - 1)]
