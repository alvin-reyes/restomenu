<?php

class Bar extends CI_Controller{

	function __construct(){
		parent::__construct();
		/*$is_logged_in = $this->session->userdata('is_logged_in');
		if(!isset($is_logged_in) || $is_logged_in != TRUE)
			redirect('login/');
		*/
		
		$this->load->model('lang_model');
		$this->lang->load('msg',$this->lang_model->getLang());
		
		$this->load->model('bar_model');
	}
	
	function index(){
		$this->getOrderQueue();
	}
	
	function getOrderQueue(){	
		//$data['data']=$this->bar_model->getOrderQueue();
		$this->load->view('bar_list');
	}
	
	function getOrderQueueContent(){
		$data = $this->bar_model->getOrderQueue();
		foreach($data as $row){
			if($row->bell=="n")
				echo "<div id='table-$row->sid' class='klist'>$row->tableName</div>";
			else
				echo "<div id='table-$row->sid' class='klist'><img style='position:relative;top:-5px;left:-5px;' src=\"".base_url()."/img/bell.png\">$row->tableName</div>";
		}
		
		$data = $this->bar_model->getBellY();
		foreach($data as $row){
			echo "<div id='tableclear' class='klist'><img style='position:relative;top:-5px;left:-5px;' src=\"".base_url()."/img/bell.png\">$row->tableName<br><button id=\"listclear-".$row->sid."\" style='font-size:12px;'>Clear call</button></div>";
		}
	}
	
	function getTicketBySid(){
		$is_logged_in = $this->session->userdata('is_logged_in');
		if(!isset($is_logged_in) || $is_logged_in != TRUE)
			redirect('login/');
		$result['data'] = $this->bar_model->getTicketBySid($this->input->post('sid')); 
		$this->load->view('bar_ticket',$result);
	}
	
	function updateRowStatus(){
		$this->bar_model->updateRowStatus($this->input->post('ksid'),$this->input->post('id'),$this->input->post('status'));
	}
	
	function setDone(){
		$this->bar_model->setDone($this->input->post('ksid'));
	}
	
	function clearCallBySid(){
		$this->bar_model->clearCallBySid($this->input->post('sid'));
	}
}

?>
