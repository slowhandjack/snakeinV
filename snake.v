import os
import rand

fn main() {
	mut counter := u8(0)
	mut pos := u8(0) // Position of Snakehead
	mut food := rand.int_in_range(0, 63)?
	mut points := u8(0) // Player Points
	mut screenz := []string{}
	mut pos_history := []u8{}
	mut snakelen := u8(0)

	for i in 0 .. 63 {
		screenz << ' ' // The << is to append the latter to the former.
	}
	
	for i in 0 .. 30 {
			os.system('clear') // Clears Terminal Screen
			if pos == food {
			snakelen += 1
			points += 10
			food = rand.int_in_range(0, 63)?
			//os.system('afplay /System/Library/Sounds/Funk.aiff')
			}
			screenz[pos] = '0'
			pos_history.reverse_in_place()
			for num in 0 .. snakelen{
				screenz[(pos_history[num])] = '0'
			}
			screenz[food] = '*'
			println("Points: $points")
			for tile in screenz {
				if counter < 8 {
					counter += 1
					print("[$tile]")
					print(' ')
				} 
				else {
					println("")
					//println("")
					counter = 0
				}
			}
			screenz[pos] = ' '
			for num in 0 .. snakelen{
				screenz[(pos_history[num])] = ' '
			}
			println(" ")
			pos_history.reverse_in_place()
			pos_history << pos
			posoffset := os.input("Move Pawn Left, Right, Down or Up? ")
			match posoffset {
				'L' {pos -= 1}
				'R' {pos += 1}
				'D' {pos += 9}
				'U' {pos -= 9}
				else {break}
			}
	}
	os.system('clear')
	println("Final Score: $points")
}