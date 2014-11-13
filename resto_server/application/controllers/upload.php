<?php


class Upload extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->helper(array('form', 'url','error_helper'));
		$this->load->model('lang_model');
		$this->load->model('upload_model');
		$this->lang->load('msg',$this->lang_model->getLang());
		
		//$is_logged_in = $this->session->userdata('is_logged_in');
		//if(!isset($is_logged_in) || $is_logged_in != TRUE)
		//	redirect('login/');
	}

	function index()
	{
		//$this->load->view('upload_form');
	}
	
	function mediaUpload(){
		$data['mediaList'] = $this->upload_model->getMedia();
		$data['filelabel'] = "";
		$this->load->view('mediaupload_form',$data);
	}

	function doMediaUpload()
	{
		$this->load->library('form_validation');
		
		
		
		if ($this->form_validation->run() == FALSE){
			
			$data['mediaList'] = $this->upload_model->getMedia();
			$data['error'] = validation_errors();
			$data['filelabel'] = set_value('filelabel');
			$this->load->view('mediaupload_form', $data);
			return;
		}
		
		$config['upload_path'] = './media/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size']	= '5000';
		//$config['max_width']  = '800';
		//$config['max_height']  = '600';
		
		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload())
		{
			$data['mediaList'] = $this->upload_model->getMedia();
			$data = array('error' => $this->upload->display_errors());
			$data['filelabel'] = set_value('filelabel');
			$this->load->view('mediaupload_form', $data);
		}
		else
		{
			//$data['error'] = '<pre>'.var_dump($this->upload->data()).'</pre>';
			$fileData = $this->upload->data();
			$modelData['label'] = $this->input->post('filelabel');
			$modelData['fileName'] = $fileData['file_name'];
			$this->upload_model->saveImage($modelData);
			$data['mediaList'] = $this->upload_model->getMedia();
			$data['filelabel'] = "";
			$this->load->view('mediaupload_form',$data);
		}
	}
	
	function getMediaById(){
		
	}
	
	function deleteMedia(){
		$idImages = $this->input->post('idImages');		
		$fileName = $this->upload_model->getMediaById($idImages)->fileName;		
		unlink('./media/'.$fileName);
		$this->upload_model->deleteMedia($idImages);
		$data['mediaList'] = $this->upload_model->getMedia();
		$data['filelabel'] = "";
		$this->load->view('media_list',$data);
		
	}
}
?>
