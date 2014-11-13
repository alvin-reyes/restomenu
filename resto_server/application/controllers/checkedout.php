<?php


class Checkedout extends CI_Controller{
	
	function __construct(){
		parent::__construct();
		/*$is_logged_in = $this->session->userdata('is_logged_in');
		if(!isset($is_logged_in) || $is_logged_in != TRUE)
			redirect('login/');
		*/
		
		$this->load->model('lang_model');
		$this->lang->load('msg',$this->lang_model->getLang());
		
		$this->load->model('checkedout_model');
	}
	
	function index(){
		$result = $this->getTicketsList();
	}
	
	function getTicketsList(){
		//return $this->checkedout_model->getTicketsList();
		$this->load->view('checkedout_list');
	}
	
	function getTicketsQueueContent(){
		$data = $this->checkedout_model->getTicketsList();
		foreach($data as $row){
				echo "<div id='table-$row->idTickets' class='klist'>$row->tableName</div>";
		}
	}
	
	function getTicketById(){
		$is_logged_in = $this->session->userdata('is_logged_in');
		if(!isset($is_logged_in) || $is_logged_in != TRUE)
			redirect('login/');
		$data['data'] = $this->checkedout_model->getTicketById($this->input->post('id'));
		$this->load->view('checkedout_ticket',$data);
	}
	
	function setDone(){
		$this->checkedout_model->setDone($this->input->post('ksid'));
	}
	
}

?>
