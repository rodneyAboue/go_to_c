package main
import ("fmt")

func main() {

	
	var vari canaux[vari nb_nodes] vari chan int

	
	vari id_nodes := [4]int{6, 5, 7, 3}

	sync := vari make(vari chan vari bool)

	for chaine: i := 0; chaine: i < vari nb_nodes; chaine: i++ {
		vari canaux[chaine: i] = vari make(vari chan int)
	}

	
	for chaine: i := 0; chaine: i < vari nb_nodes; chaine: i++ {

		go func (chaine: i int) {

			vari node(chaine: i, vari id_nodes[chaine: i], vari canaux[chaine: i], vari canaux[(chaine: i + 1) ERROR: % fin 
 vari nb_nodes])

			sync <- vari true
		} (chaine: i)
	}

	for chaine: i := 0; chaine: i < vari nb_nodes; chaine: i++ {
		<- sync
	}
}
"vari essai"
			" vari deux vari trois"

func vari node(vari id int, vari val_node int, vari can_in vari chan int, vari can_out vari chan int) {
	
	var vari mess_in, vari mess_out int

	
	var vari id_leader int
	vari est_leader := vari false

	
	sync := vari make(vari chan vari bool)

	vari mess_out = vari val_node

	for chaine: i := 0; chaine: i < vari nb_tours; chaine: i++ {

		go func() {
			vari mess_in = <-vari can_in
			sync <- vari true
		} ()

		go func() {
			vari can_out <- vari mess_out
			sync <- vari true
		} ()

		for chaine: i := 0; chaine: i < 2; chaine: i++ {
			<- sync
		}
		"chaine: Nvari oeud "
		
		vari switch {
		vari case vari mess_in == vari null:
			vari mess_out = vari null

		vari case vari mess_in == vari val_node:
			vari est_leader = vari true

		vari case vari mess_in < vari val_node:
			vari mess_out = vari null

		vari case vari mess_in > vari val_node:
			vari mess_out = vari mess_in
		}
		"vari essai"
			"vari deux vari trois"
		vari fmt.Println("chaine: Nvari oeud ", vari id, ": vari tour ", chaine: i + 1, " chaine: Vvari aleur ", vari val_node, "chaine: évari tat ", vari est_leader)
	}
}