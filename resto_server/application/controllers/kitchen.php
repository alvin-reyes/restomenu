<?php
class Kitchen extends CI_Controller{

	function __construct(){
		parent::__construct();
		/*$is_logged_in = $this->session->userdata('is_logged_in');
		if(!isset($is_logged_in) || $is_logged_in != TRUE)
			redirect('login/');
		*/
		$this->load->model('lang_model');
		$this->lang->load('msg',$this->lang_model->getLang());
		
		$this->load->model('kitchen_model');
	}
	
	function index(){
		$this->getOrderQueue();
	}
	
	function getOrderQueue(){	
		//$data['data']=$this->kitchen_model->getOrderQueue();
		$this->load->view('kitchen_list');
	}
	
	function getOrderQueueContent(){
		$data = $this->kitchen_model->getOrderQueue();
		
		foreach($data as $row){
			//if($row->bell=="n")
				echo "<div id='table-$row->sid' class='klist' style='font-size:9px;'>Table:$row->tableName / Order ID:$row->idSessions</div>";
			//else
			//	echo "<div id='table-$row->sid' class='klist'><img style='position:relative;top:-5px;left:-5px;' src=\"".base_url()."/img/bell.png\">$row->tableName</div>";
		}
		
	}
	
	function getTicketBySid(){
		$is_logged_in = $this->session->userdata('is_logged_in');
		if(!isset($is_logged_in) || $is_logged_in != TRUE)
			redirect('login/');
		$result['data'] = $this->kitchen_model->getTicketBySid($this->input->post('sid')); 
		$this->load->view('kitchen_ticket',$result);
	}
	
	function updateRowStatus(){
		$this->kitchen_model->updateRowStatus($this->input->post('ksid'),$this->input->post('id'),$this->input->post('status'));
	}
	
	function setDone(){
		$this->kitchen_model->setDone($this->input->post('ksid'));
	}
}

?>
