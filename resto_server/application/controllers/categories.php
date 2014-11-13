<?php

class Categories extends CI_Controller {

	function __construct(){
	
		parent::__construct();
		$this->load->helper('html');
		$this->load->helper('error_helper');
		$this->load->model('lang_model');
		$this->load->model('categories_model');
		$this->lang->load('msg',$this->lang_model->getLang());
		
		$is_logged_in = $this->session->userdata('is_logged_in');
		if(!isset($is_logged_in) || $is_logged_in != TRUE)
			redirect('login/');
	}
	
	function index(){

			$this->listCategories();
	}
	
	function listCategories(){
		if($this->categories_model->countCategories()==0)
			$this->load->view('no_categories');
		else{
			$data['category'] = $this->categories_model->getCategories();
			$this->load->view('list_categories',$data);	
		}
	}
	
	function listCategories1(){
		if($this->categories_model->countCategories()>0){
			$data['category'] = $this->categories_model->getCategories();
			$this->load->view('list_categories_add',$data);
		}
	}
	
	function newCategory(){
		
		$this->load->library('form_validation');
		if ($this->form_validation->run() == FALSE || $this->input->post('edit')=='y')
			$this->load->view('categories_form');
		else{
			$data['label']=$this->input->post('categorylabel');
			$data['description']=$this->input->post('categorydescr');
			if($this->input->post('idCategory')!='-1'){
				$data['idCategories'] = $this->input->post('idCategory');
				$this->categories_model->updateCategory($data);
			}
			else{
				$this->categories_model->saveCategory($data);
			}
			$this->listCategories();
		}
	
	}
	
	function deleteCategory(){
	
	/* TO-DO : check if category in use and take appropriate action
	 */
		
		$this->categories_model->deleteCategory($this->input->post('idCategory'));
		$this->listCategories();
	}
	
	function getJSONCategoryByID(){
	
		echo $this->categories_model->getJSONCategoryByID($this->input->post('idCategory'));
		
	}
	
}
?>
