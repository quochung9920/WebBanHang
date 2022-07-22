<?php
class ModelXformXform extends Model
{
  var $formError=array(); 
	
   public function addForm($data, $id="",$quick=false) {
        
        if (!$id) {
            $sql="INSERT INTO " . DB_PREFIX . "tblform SET hideTitle= '" . (int)$data['hideTitle'] . "'";
                  isset($data['sendAdminEmail'])? $sql.= ", `sendAdminEmail` = '" . (int)$data['sendAdminEmail'] . "'":"";
                  isset($data['adminEmail'])? $sql.= ", `adminEmail` = '" . $this->db->escape($data['adminEmail']) . "'":"";
                  isset($data['formCreationDate'])? $sql.= ", `formCreationDate` = '".$data['formCreationDate']. "'":"";
                  isset($data['status'])? $sql.= ", `status` = '".(int)$data['status']."'":""; 
                  isset($data['sendUserEmail'])? $sql.= ", `sendUserEmail` = '".(int)$data['sendUserEmail']. "'":"";
                  isset($data['userEmail'])? $sql.= ", `userEmail` = '".$this->db->escape($data['userEmail']). "'":"";
                  isset($data['successType'])? $sql.= ", `successType` = '".$this->db->escape($data['successType']). "'":"";
                  isset($data['successURL'])? $sql.= ", `successURL` = '".$this->db->escape($data['successURL']). "'":"";
                  isset($data['formHeading'])? $sql.= ", `formHeading` = '".$this->db->escape($data['formHeading']). "'":"";
                  isset($data['keyword'])? $sql.= ", `keyword` = '".$this->db->escape($data['keyword']). "'":"";
                  isset($data['theme'])? $sql.= ", `theme` = '".$this->db->escape($data['theme']). "'":"";
                  isset($data['custom'])? $sql.= ", `custom` = '".$this->db->escape($data['custom']). "'":"";
                  isset($data['script'])? $sql.= ", `script` = '".$this->db->escape($data['script']). "'":"";
                  isset($data['style'])? $sql.= ", `style` = '".$this->db->escape($data['style']). "'":"";
                  isset($data['sendEmailAttachment'])? $sql.= ", `sendEmailAttachment` = '".(int)$data['sendEmailAttachment']."'":""; 
                  isset($data['emailAttachmentType'])? $sql.= ", `emailAttachmentType` = '".$this->db->escape($data['emailAttachmentType']). "'":"";
                  isset($data['emailAttachmentUser'])? $sql.= ", `emailAttachmentUser` = '".$this->db->escape($data['emailAttachmentUser']). "'":"";
                  isset($data['formModule'])? $sql.= ", `formModule` = '".(int)$data['formModule']."'":""; 
                  isset($data['customerOnly'])? $sql.= ", `customerOnly` = '".(int)$data['customerOnly']."'":""; 
        } else {
            $sql="UPDATE " . DB_PREFIX . "tblform SET hideTitle= '" . (int)$data['hideTitle'] . "'";
                  isset($data['sendAdminEmail'])? $sql.= ", `sendAdminEmail` = '" . (int)$data['sendAdminEmail'] . "'":"";
                  isset($data['adminEmail'])? $sql.= ", `adminEmail` = '" . $this->db->escape($data['adminEmail']) . "'":"";
                  isset($data['formCreationDate'])? $sql.= ", `formCreationDate` = '".$data['formCreationDate']. "'":"";
                  isset($data['status'])? $sql.= ", `status` = '".(int)$data['status']."'":"";
                  isset($data['sendUserEmail'])? $sql.= ", `sendUserEmail` = '".(int)$data['sendUserEmail']. "'":"";
                  isset($data['userEmail'])? $sql.= ", `userEmail` = '".$this->db->escape($data['userEmail']). "'":"";
                  isset($data['successType'])? $sql.= ", `successType` = '".$this->db->escape($data['successType']). "'":"";
                  isset($data['successURL'])? $sql.= ", `successURL` = '".$this->db->escape($data['successURL']). "'":"";
                  isset($data['formHeading'])? $sql.= ", `formHeading` = '".$this->db->escape($data['formHeading']). "'":"";
                  isset($data['keyword'])? $sql.= ", `keyword` = '".$this->db->escape($data['keyword']). "'":"";
                  isset($data['theme'])? $sql.= ", `theme` = '".$this->db->escape($data['theme']). "'":"";
                  isset($data['custom'])? $sql.= ", `custom` = '".$this->db->escape($data['custom']). "'":"";
                  isset($data['script'])? $sql.= ", `script` = '".$this->db->escape($data['script']). "'":"";
                  isset($data['style'])? $sql.= ", `style` = '".$this->db->escape($data['style']). "'":"";
                  isset($data['sendEmailAttachment'])? $sql.= ", `sendEmailAttachment` = '".(int)$data['sendEmailAttachment']."'":""; 
                  isset($data['emailAttachmentType'])? $sql.= ", `emailAttachmentType` = '".$this->db->escape($data['emailAttachmentType']). "'":"";
                  isset($data['emailAttachmentUser'])? $sql.= ", `emailAttachmentUser` = '".$this->db->escape($data['emailAttachmentUser']). "'":"";
                  isset($data['formModule'])? $sql.= ", `formModule` = '".(int)$data['formModule']."'":""; 
                  isset($data['customerOnly'])? $sql.= ", `customerOnly` = '".(int)$data['customerOnly']."'":""; 
                  
              $sql.=" WHERE formId = '" . (int)$id . "'";
        }
		
		$this->db->query($sql);
		
		$id = (!$id)? $this->db->getLastId(): $id;
		
		if($quick===false) {
		
				$this->db->query("DELETE FROM " . DB_PREFIX . "tblformdesc WHERE formId = '" . (int)$id . "'");
				foreach ($data['formDesc'] as $language_id => $value) {
		
		     		 $sql="INSERT INTO " . DB_PREFIX . "tblformdesc SET formId = " . (int)$id . ", languageId = " . (int)$language_id . "";
		          		   isset($value['formName'])? $sql.= ", `formName` = '" . $this->db->escape($value['formName']) . "'":"";
                  		   isset($value['formDescription'])? $sql.= ", `formDescription` = '" . $this->db->escape($value['formDescription']) . "'":"";
                  		   isset($value['adminEmailContent'])? $sql.= ", `adminEmailContent` = '" . $this->db->escape($value['adminEmailContent']) . "'":"";
                  		   isset($value['userEmailContent'])? $sql.= ", `userEmailContent` = '".$this->db->escape($value['userEmailContent']). "'":"";
                  		   isset($value['adminEmailSubject'])? $sql.= ", `adminEmailSubject` = '".$this->db->escape($value['adminEmailSubject'])."'":""; 
                  		   isset($value['userEmailSubject'])? $sql.= ", `userEmailSubject` = '".$this->db->escape($value['userEmailSubject']). "'":"";
                  		   isset($value['successMsg'])? $sql.= ", `successMsg` = '".$this->db->escape($value['successMsg']). "'":"";
                  
			         $this->db->query($sql);
		         }
		
	
		        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'form_id=" . (int)$id . "'");
		        if (isset($data['keyword'])) {
		  
		            $row_exist = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($data['keyword']) . "'")->row;
		            if($row_exist) {
		               $data['keyword'] .= rand(1111,9999);
		            } 
		  
		            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'form_id=" . (int)$id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		        }
		}
		return $id;
    }
    
    public function getFormDescriptions($formId) {
		$formDesc = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tblformdesc WHERE formId = '" . (int)$formId . "'");
		foreach ($query->rows as $result) {
			$formDesc[$result['languageId']] = array(
				'formName'             => $result['formName'],
				'formDescription'      => $result['formDescription'],
				'adminEmailContent'       => $result['adminEmailContent'],
				'userEmailContent' => $result['userEmailContent'],
				'adminEmailSubject'     => $result['adminEmailSubject'],
				'userEmailSubject'              => $result['userEmailSubject'],
				'successMsg'              => $result['successMsg']
			);
		}

		return $formDesc;
	}
	
	public function addFormRecord($data,$id="") {
	
	    if(!isset($data['orderId'])) $data['orderId'] = 0;
		
		if (!$id) {
            $sql="INSERT INTO " . DB_PREFIX . "tblformrecord SET `formId` = '" . (int)$data['formId'] . "', `userIP` = '" . $this->db->escape($data['userIP']) . "', userAgent = '" . $this->db->escape($data['userAgent']) . "', submitDate = '" . $data['submitDate'] . "', storeId = '".(int)$data['storeId']."', userId = '".(int)$data['userId']."', orderId = '".(int)$data['orderId']."'";
        } else {
            $sql="UPDATE " . DB_PREFIX . "tblformrecord SET `formId` = '" . (int)$data['formId'] . "', `userIP` = '" . $this->db->escape($data['userIP']) . "', userAgent = '" . $this->db->escape($data['userAgent']) . "', submitDate = '" . $data['submitDate'] . "', storeId = '".(int)$data['storeId']."', userId = '".(int)$data['userId']."', orderId = '".(int)$data['orderId']."' WHERE recordId = '" . (int)$id . "'";
        }
		
		$this->db->query($sql);
		
		$id = (!$id)? $this->db->getLastId(): $id;
		return $id;
    }
	
	public function addFormRecordData($data,$id="") {
	
	   if (!$id) {
            $sql="INSERT INTO " . DB_PREFIX . "tblformrecorddata SET `recordId` = '" . (int)$data['recordId'] . "', `formId` = '" . (int)$data['formId'] . "', `fieldType` = '" . $this->db->escape($data['fieldType']) . "', fieldName = '" . $this->db->escape($data['fieldName']) . "', fieldLabel = '".$this->db->escape($data['fieldLabel'])."', fieldValue = '".$this->db->escape($data['fieldValue'])."', isSerialize = '".(int)$data['isSerialize']."'";
        } else {
            $sql="UPDATE " . DB_PREFIX . "tblformrecorddata SET `recordId` = '" . (int)$data['recordId'] . "', `formId` = '" . (int)$data['formId'] . "', `fieldType` = '" . $this->db->escape($data['fieldType']) . "', fieldName = '" . $this->db->escape($data['fieldName']) . "', fieldLabel = '".$this->db->escape($data['fieldLabel'])."', fieldValue = '".$this->db->escape($data['fieldValue'])."', isSerialize = '".(int)$data['isSerialize']."' WHERE recordDataId = '" . (int)$id . "'";
        }
		
		$this->db->query($sql);
		
		$id = (!$id)? $this->db->getLastId(): $id;
		return $id;
		
    }
	
   public function setFormHeading($formId,$formHeading=array()) {
	   
	    if(!is_array($formHeading))$formHeading=array();
		$formHeading=serialize($formHeading);
		
		$this->db->query("UPDATE " . DB_PREFIX . "tblform SET formHeading='$formHeading' WHERE formId='".(int)$formId."'");
    }
	
	public function getFormHeading($formId,$all=false) {
		/* If set to all, then return all heading regardless preset heading*/
		if($all){
			  $fields = $this->getFormFields($formId,false,true);
			  $formHeading=array();
			  foreach($fields as $field){
				 $formHeading[$field['cid']]= $field['label']; 
			  }	
			  return $formHeading;
	    }
		
		$formHeading= $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblform` WHERE formId = '" . (int)$formId . "'")->row['formHeading'];
		if($formHeading)$formHeading=unserialize($formHeading);
		else {
		  $fields      = $this->getFormFields($formId,false,true);	
		  $formHeading=array();
		  foreach($fields as $field){
			 $formHeading[$field['cid']]= $field['label']; 
		     if(count($formHeading)==3) break;
		  }
		  $this->setFormHeading($formId,$formHeading);
	   } 
	   
	   return $formHeading;
    }
	

	public function getRecords($formId,$data=array()){
	
	    $sql = "SELECT * FROM " . DB_PREFIX . "tblformrecord where formId='".(int)$formId."'";
	    
	    if (isset($data['filter_store']) && $data['filter_store']) {
	        $sql .= " and storeId = '".(int)$data['filter_store']."'"; 
	    }
	    
	    if ($data['filter_start_date'] && $data['filter_end_date'] ) {
	        $sql .= " and DATE_FORMAT(submitDate,'%Y-%m-%d') between '".$data['filter_start_date']."' and '".$data['filter_end_date']."'"; 
	    }
	    
	    $sort_data = array(
		   'submitDate'
		);

	    if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
		    $sql .= " ORDER BY " . $data['sort'];
	     } else {
		    $sql .= " ORDER BY submitDate";
		 }

	    if (isset($data['order']) && ($data['order'] == 'DESC')) {
		     $sql .= " DESC";
		  } else {
			 $sql .= " DESC";
		 }

		if (isset($data['start']) || isset($data['limit'])) {
		    if ($data['start'] < 0) {
			   $data['start'] = 0;
		    }

		    if ($data['limit'] < 1) {
			   $data['limit'] = 20;
		    }

		   $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
	    }
		
		 $filter='';
		 $result=$this->db->query($sql)->rows;
		 
	     if(!$result)$result=array();
		 foreach($result as $i=>$single) {
		 
		    $date_format = $this->getDateFormat($formId, true);
		 
			 $result[$i]['submitDate']=date($date_format,strtotime($single['submitDate']));
			 $field_rows=$this->db->query("SELECT * FROM " . DB_PREFIX . "tblformrecorddata WHERE formId='".(int)$formId."' and recordId='".$single['recordId']."' order by recordDataId asc")->rows;
	         
	         if(!$field_rows)$field_rows=array();
			 foreach($field_rows as $field_row) {
				  $result[$i][$field_row['fieldName']]= $this->formatViewData($field_row);
		     }
				
	    }
		
	    return $result;
	}
	
	public function getTotalRecords($formId){
	   $row= $this->db->query("SELECT count(`recordId`) as total FROM `" . DB_PREFIX . "tblformrecord` where formId='".(int)$formId."'")->row;
	   return $row['total'];
	}
	
	/* We are fetching this way so that we can get in right order as per current form setting*/
	public function getRecordById($recordId,$ignore_empty=true){
          
          $this->load->language('module/xform');
          
		  $return=array();
		  
		  $recordInfo = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformrecord` WHERE recordId = '" . (int)$recordId . "'")->row;
		  $formId = $recordInfo['formId'];
		  $fields      = $this->getFormFields($formId,false,true);
		  
		  $date_format = $this->getDateFormat($formId, true);	
		  
		  $return[$this->language->get('text_submission_date')]= date($date_format,strtotime($recordInfo['submitDate']));
		  $return[$this->language->get('text_IP')]= $recordInfo['userIP'];
		  $return[$this->language->get('text_browser')]= $recordInfo['userAgent'];
		 
		  
		  foreach($fields as $field){
	
	        $recordFieldData= $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformrecorddata` WHERE fieldName='".$field['cid']."' and recordId='".(int)$recordId."'")->row;
		    $fieldValue=$this->formatViewData($recordFieldData);
		    if($ignore_empty && !$fieldValue) continue;
		    $return[$field['label']]=$fieldValue;
		  }
		
		  
	    return $return;
	}
	
	 public function getRecordSearchKey($recordId){
        $recordData = $this->getRecordById($recordId,true);
        $return = '';
        foreach($recordData as $value) {
           $return .= ' '.$value;
        }
        return trim($return);
     }	
	
   public function processFormEmail($recordId) {
	   
	   $recordInfo = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformrecord` WHERE recordId='".(int)$recordId."'")->row;
	   $formInfo = $this->getForm((int)$recordInfo['formId']);
	   
	   $date_format = $this->getDateFormat($recordInfo['formId'], true);
	   
	   $product_id = isset($this->session->data['xproduct_id'])?$this->session->data['xproduct_id']:'';
	   $product_id = isset($this->request->post['product_id'])?$this->request->post['product_id']:$product_id;
	   $product_id = isset($this->request->get['product_id'])?$this->request->get['product_id']:$product_id;
	   
	   
	   $product_name = '';
	   if($product_id) {
	      $this->load->model('catalog/product');
	      $product_info = $this->model_catalog_product->getProduct($product_id);
	      $product_name= ($product_info)? $product_info['name']:'';
	   }
	   	   
	   $placeholder=array('{formName}','{recordId}','{userIP}','{submitDate}','{submitDateTime}','{siteURL}','{storeName}', '{productID}', '{productName}');
	   $replacer=array($formInfo['formName'],$recordInfo['recordId'],$recordInfo['userIP'],date($date_format,strtotime($recordInfo['submitDate'])),date($date_format.' h:i A',strtotime($recordInfo['submitDate'])), HTTP_SERVER, $this->config->get('config_name'), $product_id, $product_name);
	   $fields      = $this->getFormFields($recordInfo['formId']);	
	   $files = array();
	   foreach($fields as $field){
	
	       $recordFieldData = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformrecorddata` WHERE fieldName='".$field['cid']."' and recordId='".(int)$recordId."'")->row;
	       if($recordFieldData) {
	       
		   		$fieldValue=$this->formatViewData($recordFieldData);
		   
		   		$placeholder[]='{'.$field['cid'].'.label}';
		   		$replacer[]=$field['label'];
		   
		   		$placeholder[]='{'.$field['cid'].'.value}';
		   		$replacer[]=$fieldValue;
		   		
		   		$recordInfo[$recordFieldData['fieldName']] =  $fieldValue;
		   		
		   		if($field['field_type'] =='file' && $recordFieldData['fieldValue'] && file_exists(DIR_IMAGE.'xform/'.$recordFieldData['fieldValue'])) {
		   		   $files[] = DIR_IMAGE.'xform/'.$recordFieldData['fieldValue']; 
		   		}
		   		
		   }
		   
		}
		
	   if($formInfo['sendEmailAttachment']) {
	      $formHeading= $this->model_xform_xform->getFormHeading($recordInfo['formId'], true);
	      $records      = array();
	      $records[0]      = $recordInfo;
			
			 foreach($records as $i=>$single) {
					 $resultant=array_intersect_key($single,$formHeading); 
					 $resultant=$this->sortArrayByArray($resultant,$formHeading,'key');
					 $records[$i]=$resultant;
		     }
		 
		     $file_name = DIR_IMAGE.'xform/'.str_replace(array('#',' ',"'",'"','!','@','#','$','%','^','&','*','(',')','~','`'),'_',$formInfo['formName']);
		    
		     if($formInfo['emailAttachmentType'] == 'csv') {
		       $this->arrayToCsv($records,$formHeading,$file_name);
		       $file_name .='.csv';
		    }
		    
		    if($formInfo['emailAttachmentType'] == 'pdf') {
			    
                require(DIR_SYSTEM.'library/tcpdf/tcpdf.php');
                
				$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
				$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
				
				$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
				$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

                $pdf->SetFont('helvetica', '', 12);
                $pdf->AddPage();
                
                $html = '<style>
    				h3 {
        				color: #000000;
        				font-family: helvetica;
        				font-size: 22pt;
   						}
    				table {
        				font-family: helvetica;
        				font-size: 8pt;
        				border: 1px solid #EAEAEA;
        				border-collapse: collapse;
   					 }
    				td {
        				border: 1px solid #EAEAEA;
        				background-color: #ffffff;
   					 }
   					 td.label {
        				background-color: #F5F5F5;
        				color: #333333;
   					 } 
				</style>';
				
                $html .= '<h3>'.$formInfo['formName'].'</h3> <br />';
                
                
	            foreach($records as $row) {
				   $html .= '<table  cellpadding="6" cellspacing="0">';	
				    foreach($formHeading as $cid=>$label){
				       $html .= '<tr>'; 
				       $html .= '<td class="label" width="30%" align="left"><b>'.$label.'</b></td>';
				       $html .= '<td width="70%" align="left">'.(isset($row[$cid])?$row[$cid]:'').'</td>';
				       $html .= '</tr>';  
					 }
				   $html .= '</table> <br />'; 	
				}
				
				
				
				$pdf->writeHTML($html, true, false, true, false, '');
				
			    // Closing line
			    $pdf->Output($file_name.'.pdf','f');
			    $file_name .='.pdf';
		   }
		    
		    
	   }	
		
		
	   if($formInfo['sendAdminEmail'] && $formInfo['adminEmail'] && $formInfo['adminEmailSubject'] && $formInfo['adminEmailContent']){
		   
		   $adminEmail=$formInfo['adminEmail']; 
		   
		   $subject=$formInfo['adminEmailSubject']; 
		   $message=$formInfo['adminEmailContent'];
		   $subject=str_replace($placeholder,$replacer,$subject);
		   $message=str_replace($placeholder,$replacer,$message);
		   
		   
		   
		   if($adminEmail){
	
				if(intval(str_replace('.','',VERSION)) > 2011) {   
		        
		        	$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				
				} else {
				   $mail = new Mail($this->config->get('config_mail'));
				}
				
				
				if($formInfo['sendEmailAttachment'] && ($formInfo['emailAttachmentUser']=='admin' || $formInfo['emailAttachmentUser']=='both') && file_exists($file_name)) {
				   $mail->addAttachment($file_name);
				   
				   foreach($files as $file_single){
				      $mail->addAttachment($file_single);
				    } 
				}
				
				
				
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject(html_entity_decode($subject));
				$mail->setHtml(html_entity_decode($message));
				$mail->setText(strip_tags($message));
				
				$adminEmails=explode(';',$adminEmail);
				foreach ($adminEmails as $adminEmail) {
						if ($adminEmail && preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', trim($adminEmail))) {
							$mail->setTo(trim($adminEmail));
							$mail->send();
						}
				}
	
		   }
		}
		
		
		if($formInfo['sendUserEmail'] && $formInfo['userEmailSubject'] && $formInfo['userEmailContent'] && $formInfo['userEmail']){
		   $emailFieldData = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformrecorddata` WHERE fieldName='".$formInfo['userEmail']."' and recordId='".(int)$recordId."'")->row; 
		   $userEmail=$emailFieldData['fieldValue'];
		   
		   $subject=$formInfo['userEmailSubject']; 
		   $message=$formInfo['userEmailContent'];
		   $subject=str_replace($placeholder,$replacer,$subject);
		   $message=str_replace($placeholder,$replacer,$message);
		  
		   if($userEmail){
		   
		      if(intval(str_replace('.','',VERSION)) > 2011) { 
		        
		        	$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				
				} else {
				   $mail = new Mail($this->config->get('config_mail'));
				}
				
				if($formInfo['sendEmailAttachment'] && ($formInfo['emailAttachmentUser']=='user' || $formInfo['emailAttachmentUser']=='both') && file_exists($file_name)) {
				   $mail->addAttachment($file_name);
				}
		        
				$mail->setTo($userEmail);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject(html_entity_decode($subject));
				$mail->setHtml(html_entity_decode($message));
				$mail->setText(strip_tags($message));
				$mail->send();
		   }
		}
		
		if($formInfo['sendEmailAttachment'] && file_exists($file_name)) {
				 @unlink($file_name); //delete temp file
		 }
		
   }
   
   public function processFormData($recordId, $data, $isAdmin=false) {
	   
	   $formId = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformrecord` WHERE recordId = '" . (int)$recordId . "'")->row['formId'];
	   $fields      = $this->getFormFields($formId);	
	   
	   $hasPriceField=0; 
	   $paymentStatus=0;   
	   $totalAmount=0;
	  
	   foreach($fields as $field){
		  
		  $fieldValue='';
		  $isSerialize=0;
		 
		  
		  if($field['field_type']=='copy' || $field['field_type']=='submit' || $field['field_type']=='captcha')
		   {
			  continue;
		   }
		 elseif($field['field_type']=='text' || $field['field_type']=='hidden' || $field['field_type']=='email' || $field['field_type']=='paragraph' || $field['field_type']=='dropdown')
		   {
			  $fieldValue=isset($data[$field['cid']])?$data[$field['cid']]:'';
		   }
		  elseif($field['field_type'] =='date' || $field['field_type'] =='time' || $field['field_type'] =='address')
		   {
			  if(!isset($data[$field['cid']]))$data[$field['cid']]=array();
			  if(!is_array($data[$field['cid']]))$data[$field['cid']]=array();
			  $fieldValue=serialize($data[$field['cid']]);
			  $isSerialize=1;
		   } 
		   elseif($field['field_type'] =='radio')
		    {  
			  $fieldValue=isset($data[$field['cid']])?$data[$field['cid']]:'';
			  if(isset($data[$field['cid']]) && $data[$field['cid']]=='Other'.$field['cid'] && isset($data['other_value'.$field['cid']]) && $data['other_value'.$field['cid']]){
				  $fieldValue='Other -'.$data['other_value'.$field['cid']];  
			  }
			   
		    }
		   elseif($field['field_type'] =='checkboxes')
		   {   
			  if(!isset($data[$field['cid']]))$data[$field['cid']]=array();
			  if(!is_array($data[$field['cid']]))$data[$field['cid']]=array();
			  if(isset($data[$field['cid']]['other']) && isset($data[$field['cid']]['other_value']) && $data[$field['cid']]['other_value']){
				 $data[$field['cid']][]='Other -'.$data[$field['cid']]['other_value'];  
			  }
			  $fieldValue=serialize($data[$field['cid']]);
			  $isSerialize=1;
		   } 
		   elseif($field['field_type'] =='file')
		   {
			  if(isset($_FILES['data']['name'][$field['cid']]) && $_FILES['data']['name'][$field['cid']]){
				  $ext = substr(strrchr(($_FILES['data']['name'][$field['cid']]), "."), 1);
				  $fieldValue=time()."_".$formId.".$ext";
				  @copy($_FILES['data']['tmp_name'][$field['cid']],DIR_IMAGE.'xform/'.$fieldValue);
			   }
		   } 
		   else{
			  $fieldValue=isset($data[$field['cid']])?$data[$field['cid']]:'';
		   }
		   
		   $recordDataId='';
		   
		   if($isAdmin) { 
		     $recordDataId= $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformrecorddata` WHERE recordId = '" . (int)$recordId . "' and fieldName='".$field['cid']."'")->row['recordDataId'];
		   }
		   

		   
		   $recorddata=array();
		   $recorddata['recordId']=$recordId;
		   $recorddata['formId']=$formId;
		   $recorddata['fieldType']=$field['field_type'];
		   $recorddata['fieldName']=$field['cid'];
		   $recorddata['fieldLabel']=$field['label'];
		   $recorddata['fieldValue']=$fieldValue;
		   $recorddata['isSerialize']=$isSerialize;
		   $this->addFormRecordData($recorddata,$recordDataId);

		}
		
		$searchKey= $this->getRecordSearchKey($recordId);
		$sql="UPDATE " . DB_PREFIX . "tblformrecord SET `searchKey` = '" . $this->db->escape($searchKey) . "' WHERE recordId = '" . (int)$recordId . "'";
	    $this->db->query($sql);
	   return true;
    } 

	
	
	public function getCommonHeadings($formId) {
	   
	   $this->load->language('module/xform');		
	   $headings=array();	
	   $headings[]=array('cid'=>'userIP','label'=>$this->language->get('text_IP'));
	   $headings[]=array('cid'=>'submitDate','label'=>$this->language->get('text_submission_date'));
	   return $headings;
    }
    
    public function getDateFormat($formId, $phpFormat=false) {
    	
       $format = 'mm/dd/yyyy';
       
       $php_formats = array(
        'mm/dd/yyyy' => 'm/d/Y',
        'dd/mm/yyyy' => 'd/m/Y',
        'yyyy/mm/dd' => 'Y/m/d'
       );
       	
       $result= $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblform` WHERE formId = '".(int)$formId."'")->row;
       
       if(isset($result['dateFormat']) && $result['dateFormat']) {
         $format =  $result['dateFormat'];
       }
       
       if($phpFormat) {
         $format = $php_formats[$format];
       }
       
       return $format;
    }
	
	
	/* Format data before viewing*/
	public function formatViewData($recordFieldData, &$rawData=null){
	  
	  if($recordFieldData['fieldType']=='text' || $recordFieldData['fieldType']=='hidden' || $recordFieldData['fieldType']=='email' || $recordFieldData['fieldType']=='dropdown')
	   {
		  $rawData[$recordFieldData['fieldName']]=$recordFieldData['fieldValue'];
		  return $recordFieldData['fieldValue']; 
	   }
	  elseif($recordFieldData['fieldType']=='paragraph')
	   {
		  $rawData[$recordFieldData['fieldName']]=$recordFieldData['fieldValue'];
		  return ($recordFieldData['fieldValue'])?nl2br($recordFieldData['fieldValue']):''; 
	   }
	  elseif($recordFieldData['fieldType'] =='radio')
	   {
		  $rawData[$recordFieldData['fieldName']]=$recordFieldData['fieldValue'];
		  if(strpos($recordFieldData['fieldValue'],'Other -')){
			 $rawData[$recordFieldData['fieldName']]=='Other'.$recordFieldData['fieldName'];
			 list($other,$other_value)=explode('Other -',$recordFieldData['fieldValue']);
			 $rawData['other_value'.$recordFieldData['fieldName']]= $other_value; 
		  }
		  return $recordFieldData['fieldValue'];
	   } 
	  elseif($recordFieldData['fieldType'] =='checkboxes')
	   {
		  $recordFieldData['fieldValue']=unserialize($recordFieldData['fieldValue']);
		  
		  $rawData[$recordFieldData['fieldName']]=$recordFieldData['fieldValue'];
		  if($recordFieldData['fieldValue'] && is_array($recordFieldData['fieldValue'])){
			  foreach($recordFieldData['fieldValue'] as $singleValue){
				  
				  if(strpos($singleValue,'Other -')){
					 list($other,$other_value)=explode('Other -',$singleValue); 
					 $rawData[$recordFieldData['fieldName']]['other']=1;
					 $rawData[$recordFieldData['fieldName']]['other_value']= $other_value;
				  }
				    
			  }  
		   }
		  
		  return implode(', ',$recordFieldData['fieldValue']);
	   } 
	   elseif($recordFieldData['fieldType'] =='file')
	   {
		  $ext = strtolower(substr(strrchr(($recordFieldData['fieldValue']), "."), 1));
		  $file='';
		  if($ext){
			 if($ext=='jpg' || $ext=='png' || $ext=='gif' || $ext=='jpeg'){
			   $file='<a target="blank" href="'.str_replace('/admin','',HTTP_SERVER.'image/xform/'.$recordFieldData['fieldValue']).'"><img src="'.str_replace('/admin','',HTTP_SERVER.'image/xform/'.$recordFieldData['fieldValue']).'" width="150" /></a>';	 
		     }else{
				$file='<a target="blank" href="'.HTTP_SERVER.'index.php?route=xform/xform/dl&f='.$recordFieldData['fieldValue'].'">Uploaded File</a>';	 
			  }  
		  }
		  $rawData[$recordFieldData['fieldName']]=$recordFieldData['fieldValue'];
		  return $file;
	   } 
	   elseif($recordFieldData['fieldType'] =='date')
	   {  
	      $date_format = $this->getDateFormat($recordFieldData['formId']);
	      
		  $recordFieldData['fieldValue']=unserialize($recordFieldData['fieldValue']);
		  
		  if($date_format == 'dd/mm/yyyy') {
		   $date=(isset($recordFieldData['fieldValue']['day']) && isset($recordFieldData['fieldValue']['month']))?$recordFieldData['fieldValue']['day'].'/'.$recordFieldData['fieldValue']['month'].'/'.$recordFieldData['fieldValue']['year']:'';
		  }
		  else if($date_format == 'yyyy/mm/dd') {
		    $date=(isset($recordFieldData['fieldValue']['day']) && isset($recordFieldData['fieldValue']['year']))?$recordFieldData['fieldValue']['year'].'/'.$recordFieldData['fieldValue']['month'].'/'.$recordFieldData['fieldValue']['day']:'';
		  }
		  else {
		    $date=(isset($recordFieldData['fieldValue']['day']) && isset($recordFieldData['fieldValue']['month']))?$recordFieldData['fieldValue']['month'].'/'.$recordFieldData['fieldValue']['day'].'/'.$recordFieldData['fieldValue']['year']:'';
		  }
		  
		  $rawData[$recordFieldData['fieldName']]=$recordFieldData['fieldValue'];
		  return $date;
		  
	   }
	   elseif($recordFieldData['fieldType'] =='time')
	   {
		  $recordFieldData['fieldValue']=unserialize($recordFieldData['fieldValue']);
		  $time=(isset($recordFieldData['fieldValue']['hour']) && isset($recordFieldData['fieldValue']['minute']))?$recordFieldData['fieldValue']['hour'].':'.$recordFieldData['fieldValue']['minute'].' '.$recordFieldData['fieldValue']['ampm']:'';
		  $rawData[$recordFieldData['fieldName']]=$recordFieldData['fieldValue'];
		  return $time;
	   }
	   elseif($recordFieldData['fieldType'] =='address')
	   {
		  $recordFieldData['fieldValue']=unserialize($recordFieldData['fieldValue']);
		  $address= $recordFieldData['fieldValue']['steet'];
		  $address.= isset($recordFieldData['fieldValue']['city'])?', '.$recordFieldData['fieldValue']['city']:'';
		  $address.= isset($recordFieldData['fieldValue']['state'])?', '.$recordFieldData['fieldValue']['state']:'';
		  $address.= isset($recordFieldData['fieldValue']['zip'])?' '.$recordFieldData['fieldValue']['zip']:'';
		  $address.= isset($recordFieldData['fieldValue']['country'])?', '.$recordFieldData['fieldValue']['country']:'';     $rawData[$recordFieldData['fieldName']]=$recordFieldData['fieldValue'];
		  return $address;
	   }  
	   return $recordFieldData['fieldValue'];
    }
	
	
	public function getForm($formId){
	   $result= $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblform` WHERE formId = '".(int)$formId."'")->row;
	   if(!$result)$result=array();
	   
	   $formDesc  = $this->getFormDescriptions($formId);
	   $language_id=$this->config->get('config_language_id');
	   $result['formName']= isset($formDesc[$language_id]['formName'])?$formDesc[$language_id]['formName']:'untitled form';
	   $result['formDescription']= isset($formDesc[$language_id]['formDescription'])?$formDesc[$language_id]['formDescription']:'';
	   $result['adminEmailContent']= isset($formDesc[$language_id]['adminEmailContent'])?$formDesc[$language_id]['adminEmailContent']:'';
	   $result['userEmailContent']= isset($formDesc[$language_id]['userEmailContent'])?$formDesc[$language_id]['userEmailContent']:'';
	   $result['adminEmailSubject']= isset($formDesc[$language_id]['adminEmailSubject'])?$formDesc[$language_id]['adminEmailSubject']:'';
	   $result['userEmailSubject']= isset($formDesc[$language_id]['userEmailSubject'])?$formDesc[$language_id]['userEmailSubject']:'';
	   $result['successMsg']= isset($formDesc[$language_id]['successMsg'])?$formDesc[$language_id]['successMsg']:'';

	   return $result;
	}
	
	public function deleteForm($formId){
	   $this->db->query("DELETE FROM `" . DB_PREFIX . "tblform` WHERE formId = '".(int)$formId."'");
	   $this->db->query("DELETE FROM `" . DB_PREFIX . "tblformfield` WHERE formId = '".(int)$formId."'");
	   $this->db->query("DELETE FROM `" . DB_PREFIX . "tblformlang` WHERE formId = '".(int)$formId."'");
	   $this->db->query("DELETE FROM `" . DB_PREFIX . "tblformrecord` WHERE formId = '".(int)$formId."'");
	   $this->db->query("DELETE FROM `" . DB_PREFIX . "tblformrecorddata` WHERE formId = '".(int)$formId."'");
	}
	
	public function deleteFormRecord($recordId){
	   
	   $this->db->query("DELETE FROM `" . DB_PREFIX . "tblformrecord` WHERE recordId = '".(int)$recordId."'");
	   $this->db->query("DELETE FROM `" . DB_PREFIX . "tblformrecorddata` WHERE recordId = '".(int)$recordId."'");
	}
	
	
	public function getForms($data = array()) {
	    
	    $sql = "SELECT * FROM `" . DB_PREFIX . "tblform`";
	    
	    $sort_data = array(
				'formCreationDate'
		);

	    if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
		    $sql .= " ORDER BY " . $data['sort'];
	     } else {
		    $sql .= " ORDER BY formCreationDate";
		 }

	    if (isset($data['order']) && ($data['order'] == 'DESC')) {
		     $sql .= " DESC";
		  } else {
			 $sql .= " ASC";
		 }

		if (isset($data['start']) || isset($data['limit'])) {
		    if ($data['start'] < 0) {
			   $data['start'] = 0;
		    }

		    if ($data['limit'] < 1) {
			   $data['limit'] = 20;
		    }

		   $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
	    }
	
	   $result= $this->db->query($sql)->rows;
	   if(!$result)$result=array();
	   return $result;
	}
	
	public function getTotalForms(){
	   $row= $this->db->query("SELECT count(`formId`) as total FROM `" . DB_PREFIX . "tblform`")->row;
	   return $row['total'];
	}
	
	
	
	public function addFormFields($fields,$formId)
	{
	   if(!is_array($fields))$fields=array(); 
	   $insertedId=array();
	  
	   foreach($fields as $i=>$field)
	   {
	     if(!empty($field))
		 {

		    $label = $field['label'];
			$fieldType = $field['field_type'];
			$required = ($field['required'])?1:0;
			$hideLabel = ($field['hide_label'])?1:0;
			$fieldParam = is_array($field['field_options'])?$field['field_options']:array();
			$fieldParam = serialize($fieldParam);
			
			$name = $field['cid'];
			$field_row= $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformfield` WHERE name='".$name."' and formId = '" . (int)$formId . "'")->row;
			if($field_row){
			   $fieldId = $field_row['fieldId'];
			   $sql="UPDATE " . DB_PREFIX . "tblformfield SET `formId` = '" . (int)$formId . "', `label` = '" . $this->db->escape($label) . "', `name` = '" . $this->db->escape($name) . "', fieldType = '" . $this->db->escape($fieldType) . "', required = '".(int)$required."', hideLabel = '".(int)$hideLabel."', fieldParam = '".$this->db->escape($fieldParam)."', sortOrder = '".(int)$i."' WHERE fieldId = '" . (int)$fieldId . "'";
			   $this->db->query($sql);
			}
			else{
			   $sql="INSERT INTO " . DB_PREFIX . "tblformfield SET `formId` = '" . (int)$formId . "', `label` = '" . $this->db->escape($label) . "', `name` = '" . $this->db->escape($name) . "', fieldType = '" . $this->db->escape($fieldType) . "', required = '".(int)$required."', hideLabel = '".(int)$hideLabel."', fieldParam = '".$this->db->escape($fieldParam)."', sortOrder = '".(int)$i."'";
			   $this->db->query($sql);
			   $fieldId = $this->db->getLastId();
		    }
			
			$insertedId[]=$fieldId;
		 }
	   } 
	   
	   if($insertedId){
          $this->db->query("DELETE from " . DB_PREFIX . "tblformfield WHERE formId='".$formId."' and fieldId not in (".implode(',',$insertedId).")");
       }else{
		   /* $insertedId is blank means there is no field there */
		  $this->db->query("DELETE from " . DB_PREFIX . "tblformfield WHERE formId='".$formId."'");   
	   }
	   
	   return true;
	}
	
  
	
	public function getFormFields($formId,$onlyReq=false,$onlyInput=false){
		
		$filter='';
		$filter.=($onlyReq)?" and required=1":"";
		$filter.=($onlyInput)?" and fieldType not in ('submit','captcha','copy')":'';
		
		$result = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformfield` WHERE formId = '" . (int)$formId . "' $filter order by sortOrder asc")->rows;
		$fields = array();
		
		foreach($result as $single){
		
			$fieldParam=array();  
			if($single['fieldParam'])$fieldParam=unserialize($single['fieldParam']);  
			
			foreach($fieldParam as $paramIndex=>$paramValue){
			   if($paramIndex=='checked' || $paramIndex=='include_blank_option' || $paramIndex=='include_other_option'){
				   $fieldParam[$paramIndex]=($paramValue)?true:false;
				 }	
			}
			
			$fields[] = array(
				'label'           => $single['label'],
				'cid'            => $single['name'],
				'field_type'      => $single['fieldType'],
				'required'        => ($single['required'])?true:false,
				'hide_label'        => ($single['hideLabel'])?true:false,
				'field_options'   => $fieldParam
			);
		   }

		return $fields;
	}
	
	public function getFormKeywords($formId) {
	 
	  $filter = '';
	  $result = $this->db->query("SELECT name, label FROM `" . DB_PREFIX . "tblformfield` WHERE formId = '" . (int)$formId . "' $filter order by sortOrder asc")->rows;
	  if(!$result)$result=array();

	  $keyword=array();
	  foreach($result as $index=>$single){
	  
	    $keyword[$index]=array( 'label'=>'{'.$single['name'].'.label}',
	     				  'value'=>'{'.$single['name'].'.value}',
	     				  'element'=>'{'.$single['name'].'.element}',
	     				  'info'=>'{'.$single['name'].'.info}',
	     				  'error'=>'{'.$single['name'].'.error}',
	     				   'title' => $single['label']
	     				);  
	  }
	
	  return $keyword;
   }
   
   public function getFormEmails($formId, $ui=false,$sel=''){
	 
	  $result = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformfield` WHERE formId='".(int)$formId."' and fieldType='email' order by fieldId asc")->rows;
	  if(!$result)$result=array();
	  if($ui===false) return $result;
	  
	  $ui_options='<option value="">-Select-</option>';
	  foreach($result as $email_field){
		   $selected=($sel==$email_field['name'])?'selected':'';
		   $ui_options.='<option '.$selected.' value="'.$email_field['name'].'">'.$email_field['label'].'</option>'; 
		}
	  
	  return $ui_options;
   }	
	
 public function validateForm($formId,$data, $isAdmin=false){
    $fields      = $this->getFormFields($formId,true);	 
	$validate=true;
	
	$this->formError = array();
     
	foreach($fields as $field){
	  
	  $regex = (isset($field['field_options']['regex']) && $field['field_options']['regex'])?$field['field_options']['regex']:'';
	   
	  if($field['field_type']=='copy' || $field['field_type']=='hidden' || $field['field_type']=='submit')
	   {
		  continue;
	   }
	   elseif($field['field_type']=='email')
	   {
		  if(!isset($data[$field['cid']])) $data[$field['cid']] = '';
		  
		  if(filter_var($data[$field['cid']], FILTER_VALIDATE_EMAIL)===false){
			  $validate=false;
		      $this->formError[]=$field['cid'];  
		   }
		   
		   if($regex && !preg_match($regex,$data[$field['cid']])) {
		      $validate=false;
		      $this->formError[]=$field['cid'];  
		   }
		   
	   }
	elseif($field['field_type']=='text' || $field['field_type']=='paragraph' || $field['field_type']=='price' || $field['field_type']=='dropdown')
	   {
	
		  if(!isset($data[$field['cid']])) $data[$field['cid']] = '';
		  
		  if(!$data[$field['cid']]){
			  $validate=false;
		      $this->formError[]=$field['cid'];  
		   }
		  
		   if($regex && !preg_match($regex,$data[$field['cid']])) {
		      $validate=false;
		      $this->formError[]=$field['cid'];
		   }
	   }
	   elseif($field['field_type']=='checkboxes')
	   {
		  if(!isset($data[$field['cid']])) $data[$field['cid']] = array();
		
		  if(!$data[$field['cid']]){
		      if(!isset($data[$field['cid']]['other_value'])) $data[$field['cid']]['other_value'] = '';
		      if(!$data[$field['cid']]['other_value']) {
			    $validate=false;
		        $this->formError[]=$field['cid'];  
		      }
		   }
		   
	   }
	   elseif($field['field_type']=='radio')
	   {
		  if(!isset($data[$field['cid']])) $data[$field['cid']] = '';
          if(!isset($data['other_value'.$field['cid']])) $data['other_value'.$field['cid']] ='';
		  
		  if(!$data[$field['cid']] && !$data['other_value'.$field['cid']]){
			  $validate=false;
		      $this->formError[]=$field['cid'];  
		   }
	   }
	   
	   
	  elseif($field['field_type'] =='captcha' && !$isAdmin)
	   { 
		   if(!isset($data[$field['cid']])) $data[$field['cid']] = '';
		   
		   if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $data[$field['cid']])) {
			  $validate=false;
		      $this->formError[]=$field['cid'];  
		   }
		   
		   
	   } 
	   elseif($field['field_type'] =='file')
	   { 
		  if(!isset($_FILES['data']['name'][$field['cid']])) $_FILES['data']['name'][$field['cid']] = '';
		  
		  if(!isset($_FILES['data']['name'][$field['cid']]) || !$_FILES['data']['name'][$field['cid']]){
			  $validate=false;
		      $this->formError[]=$field['cid'];  
		   }
	   } 
	   elseif($field['field_type'] =='date')
	   {
		  if(!isset($data[$field['cid']])) $data[$field['cid']] = '';
		  if(!isset($data[$field['cid']]['day'])) $data[$field['cid']]['day'] = '';
		  if(!isset($data[$field['cid']]['day'])) $data[$field['cid']]['month'] = '';
		  if(!isset($data[$field['cid']]['day'])) $data[$field['cid']]['year'] = '';
		  
		  if(!$data[$field['cid']]['day'] || !$data[$field['cid']]['month'] || !$data[$field['cid']]['year']){
			  $validate=false;
		      $this->formError[]=$field['cid'];  
		   }
	   }
	   elseif($field['field_type'] =='time')
	   {
	      if(!isset($data[$field['cid']])) $data[$field['cid']] = '';
		  if(!isset($data[$field['cid']]['hour'])) $data[$field['cid']]['hour'] = '';
		  if(!isset($data[$field['cid']]['minute'])) $data[$field['cid']]['minute'] = '';
		  
		  if(!$data[$field['cid']]['hour'] || !$data[$field['cid']]['minute']){
			  $validate=false;
		      $this->formError[]=$field['cid'];  
		   }
	   }
	   elseif($field['field_type'] =='address')
	   {
		  if(!isset($data[$field['cid']])) $data[$field['cid']] = '';
		  if(!isset($data[$field['cid']]['steet'])) $data[$field['cid']]['steet'] = '';
		  if(!isset($data[$field['cid']]['city'])) $data[$field['cid']]['city'] = '';
		  if(!isset($data[$field['cid']]['state'])) $data[$field['cid']]['state'] = '';
		  if(!isset($data[$field['cid']]['zip'])) $data[$field['cid']]['zip'] = '';
		  
		  if(!$data[$field['cid']]['steet'] || !$data[$field['cid']]['city'] || !$data[$field['cid']]['state']  || !$data[$field['cid']]['zip']){
			  $validate=false;
		      $this->formError[]=$field['cid'];  
		   }
	   }  
    }
	
	
	return $validate;
 }
 

	
 public function renderForm($formId,$data=array(), $isAdmin=false, $fromModule=false, $layout = false){
	  
	  $this->load->language('module/xform');
	  
	  $formErrorMessage=array(
	 	'text'=>$this->language->get('error_text'),
	 	'email'=>$this->language->get('error_email'),
	 	'paragraph'=>$this->language->get('error_paragraph'),
	 	'dropdown'=>$this->language->get('error_dropdown'),
	 	'checkboxes'=>$this->language->get('error_check'),
	 	'radio'=>$this->language->get('error_radio'),
	 	'file'=>$this->language->get('error_file'),
	 	'address'=>$this->language->get('error_address'),
	 	'time'=>$this->language->get('error_time'),
	 	'date'=>$this->language->get('error_date'),
	 	'captcha'=>$this->language->get('error_captcha'),
	 );
	
	$language_id=$this->config->get('config_language_id');
	$formInfo = $this->getForm($formId);
	
	$fields      = $this->getFormFields($formId);
	$this->load->model('localisation/country');
	$countries = $this->model_localisation_country->getCountries();
	$countryInfo = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE country_id = '" . $this->config->get('config_country_id'). "'")->row;
   
    $theme = isset($formInfo['theme'])?$formInfo['theme']:'classic';
    
    if($fromModule && $theme!='custom') $theme = 'module';
     
    $output = ""; 
    if(!$isAdmin && $theme!='custom') {
      $output .= '<link href="catalog/view/theme/default/stylesheet/xform/'.$theme.'.css" rel="stylesheet">';
    }
    
    $dateInput = false;
    
    if(!$isAdmin) {
    
       $output .= html_entity_decode($formInfo['script']);
       $output .= html_entity_decode($formInfo['style']);
       $output .='<style>li.li-hidden{display:none;}</style>';
    }
    
    if($isAdmin && $theme=='custom')  $theme = 'classic'; // custom theme is not available for admin
	
	if(!$layout) {
		$output .= '<div class="form-wrapper">';
		if(!$formInfo['hideTitle']) $output .= '<h1>'.$formInfo['formName'].'</h1>'; 
		if($formInfo['formDescription']) $output .= '<p class="form-desc">'.$formInfo['formDescription'].'</p>';    
		$output   .= '<form  id="xform-'.$formId.'" method="post" class="form-class" enctype="multipart/form-data" action="">';
	}
	
	if($theme!='custom') {
      $output   .='<ul class="form-ul">';
    }
    
    if($theme=="custom") {
       $output .= html_entity_decode($formInfo['custom']);
    }
    
    $form_langs = $this->getFormLang($formId, $language_id);
    $lables = $form_langs['labels'];
    $lang_options = $form_langs['options'];
    $lang_guidelines = $form_langs['guidelines'];
    $lang_errors = $form_langs['errors'];
    
    $hidden_keywords = array('{firstName}','{lastName}','{name}', '{email}', '{phone}', '{address}', '{city}', '{state}', '{zip}', '{company}','{productId}','{productName}','{productModel}');
    $hidden_replacers = array();
    
    $customerInfo = array();
    $addressInfo = array();
    $zoneInfo = array();
    
	if($this->customer->isLogged()) {
	   $customerInfo = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . $this->customer->isLogged(). "'")->row;
	   $addressInfo = $this->db->query("SELECT * FROM " . DB_PREFIX . "address WHERE address_id = '" . $customerInfo['address_id']. "'")->row;
	   $zoneInfo = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE zone_id = '" . $addressInfo['zone_id']. "'")->row;
	}
	
	$product_id = isset($this->session->data['xproduct_id'])?$this->session->data['xproduct_id']:'';
	$product_id = isset($this->request->post['product_id'])?$this->request->post['product_id']:$product_id;
	$product_id = isset($this->request->get['product_id'])?$this->request->get['product_id']:$product_id;
	
	$product_name = '';
	$model = '';
	if($product_id) {
	      $this->load->model('catalog/product');
	      $product_info = $this->model_catalog_product->getProduct($product_id);
	      $product_name= ($product_info)? $product_info['name']:'';
	      $model= ($product_info)? $product_info['model']:'';
	 }
	 
	 if(!$customerInfo) {
	    $customerInfo['firstname'] = '';  
	    $customerInfo['lastname'] = '';  
	    $customerInfo['email'] = '';  
	    $customerInfo['telephone'] = '';  
	    $addressInfo['address_1'] = '';  
	    $addressInfo['city'] = '';  
	    $addressInfo['postcode'] = ''; 
	    $addressInfo['company'] = '';  
	    $zoneInfo['name'] = '';  
	 } 
	 
	 $hidden_replacers = array($customerInfo['firstname'],$customerInfo['lastname'],$customerInfo['firstname'].' '.$customerInfo['lastname'], $customerInfo['email'], $customerInfo['telephone'], $addressInfo['address_1'], $addressInfo['city'], $zoneInfo['name'], $addressInfo['postcode'], $addressInfo['company'], $product_id,$product_name, $model);
	
	 foreach ($fields as $field ) {
		  
		   $css_class='f-'.$field['cid'];
		   if($field['required'])$css_class.=' required';
		   
		   if($layout) {
		     
		      $output   .= '<li class="li-'.$field['field_type'].'">';
		      $output   .= '  <label for="field-'.$field['cid'].'">{'.$field['cid'].'.label}';
		      if($field['required']) $output   .= '<abbr>*</abbr>';
		      $output   .= '  </label>';
		      $output   .= '  {'.$field['cid'].'.element}';
		      $output   .= '  <span class="help-block">{'.$field['cid'].'.info}</span>'; 
		      $output   .= '  <span class="error-block">{'.$field['cid'].'.error}</span>';
		      $output   .= '</li>';
		      continue;
		   }
		   
		   if(in_array($field['cid'],$this->formError)) $css_class.=' error';
		   
		   if($field['field_type']=='captcha' && $isAdmin){
		     $field['hide_label'] = true;
		   }
		   
		   if($field['field_type']=='hidden'){
		     $field['hide_label'] = true;
		   }
		   
		    if(!isset($field['field_options']['placeholder'])) $field['field_options']['placeholder'] = false;
		
		   $placeholder = array('{'.$field['cid'].'.label}','{'.$field['cid'].'.element}','{'.$field['cid'].'.info}','{'.$field['cid'].'.error}');
		   $keyword = array();   
		   $keyword[]= $lables[$field['cid']];
		   
		   $element_html = '';
           
           if($theme!="custom") {
		      $output   .= '<li class="li-'.$field['field_type'].'">';
		   }   
		   
		   if(!$field['hide_label'] && $theme!="custom") {
			  $output   .= '<label for="field-'.$field['cid'].'">';
			  $output   .= $lables[$field['cid']]; 
			  if($field['required']) $output   .= '<abbr>*</abbr>';
			  $output   .= '</label>';
		   }
		   
		   if($field['field_type']=='hidden'){
		        $data[$field['cid']] = (isset($field['field_options']['hidden']) && $field['field_options']['hidden'])?str_replace($hidden_keywords,$hidden_replacers, $field['field_options']['hidden']):'';
			    $css_class.=' hidden';
		        $element_html   .= '<input id="field-'.$field['cid'].'" class="'.$css_class.'" name="data['.$field['cid'].']" value="'.(isset($data[$field['cid']])?$data[$field['cid']]:'').'" type="hidden" />';  
		   }
		   
		   if($field['field_type']=='text' || $field['field_type']=='email'){
			    $css_class.=isset($field['field_options']['size'])?' '.$field['field_options']['size']:'';
			    $data[$field['cid']] = isset($data[$field['cid']])?$data[$field['cid']]:((isset($field['field_options']['hidden']) && $field['field_options']['hidden'])?str_replace($hidden_keywords,$hidden_replacers, $field['field_options']['hidden']):'');
		        
		        $placeholder_text ='';
		        if(isset($lang_guidelines[$field['cid']]) && $lang_guidelines[$field['cid']] && $field['field_options']['placeholder']) {
		           $placeholder_text = 'placeholder="'.$lang_guidelines[$field['cid']].'"';
		        }
		        
		        $element_html   .= '<input '.$placeholder_text.' id="field-'.$field['cid'].'" class="'.$css_class.'" name="data['.$field['cid'].']" value="'.(isset($data[$field['cid']])?$data[$field['cid']]:'').'" type="text" />';  
		   }
		   
		   if($field['field_type']=='paragraph'){
			    $css_class.=isset($field['field_options']['size'])?' '.$field['field_options']['size']:'';
			    $data[$field['cid']] = isset($data[$field['cid']])?$data[$field['cid']]:((isset($field['field_options']['hidden']) && $field['field_options']['hidden'])?str_replace($hidden_keywords,$hidden_replacers, $field['field_options']['hidden']):'');
				
				$placeholder_text ='';
		        if(isset($lang_guidelines[$field['cid']]) && $lang_guidelines[$field['cid']] && $field['field_options']['placeholder']) {
		           $placeholder_text = 'placeholder="'.$lang_guidelines[$field['cid']].'"';
		        }
				
				$element_html   .= '<textarea '.$placeholder_text.' id="field-'.$field['cid'].'" class="'.$css_class.'" name="data['.$field['cid'].']">'.(isset($data[$field['cid']])?$data[$field['cid']]:'').'</textarea>';
		   }
		   
		   if($field['field_type']=='copy'){
				$element_html   .= '<p id="field-'.$field['cid'].'" class="'.$css_class.'" name="data['.$field['cid'].']">'.(isset($field['field_options']['html'])?$field['field_options']['html']:'').'</p>';
		   }
		   
		    if($field['field_type']=='dropdown'){
			
			   $element_html   .= '<select id="field-'.$field['cid'].'" class="'.$css_class.'" name="data['.$field['cid'].']">';
			   $element_html   .=isset($field['field_options']['include_blank_option'])?'<option value="">'.$this->language->get('text_xform_select').'</option>':'';
			    foreach ($field['field_options']['options'] as $inc=>$option){
			      $value=($option['value'])?$option['value']:$option['label'];	 
				  if(!isset($data[$field['cid']]) && $option['checked'])$data[$field['cid']]=	$value; // set initial value if data is not set
			      $selected=(isset($data[$field['cid']]) && $data[$field['cid']]==$value)?'selected':'';
			      $option['label'] = isset($lang_options[$field['cid'].'_'.$inc])?$lang_options[$field['cid'].'_'.$inc]:$option['label'];
			      $element_html   .= '<option '.$selected.' value="'.htmlentities($value).'">' .html_entity_decode($option['label']). '</option>';
			    }
			    $element_html    .= '</select>';
			  
		   }
		   
		   if($field['field_type']=='checkboxes'){
			 
			    $element_html   .= '<div class="checkbox-wrapper">';
				 $counter=1;
			    foreach ($field['field_options']['options'] as $inc=>$option){
			      $value=($option['value'])?$option['value']:$option['label'];	 
				  
				  if(!isset($data[$field['cid']]))$data[$field['cid']]=array();
				  if($option['checked'])$data[$field['cid']][]=	$value; // set initial selection if data is not set
			    
				  $checked=(in_array($value,$data[$field['cid']]))?'checked':'';
				  
			      $option['label'] = isset($lang_options[$field['cid'].'_'.$inc])?$lang_options[$field['cid'].'_'.$inc]:$option['label'];
			      $element_html   .= '<label for="field-'.$field['cid'].'-'.$counter.'"><input id="field-'.$field['cid'].'-'.$counter.'" class="'.$css_class.'" name="data['.$field['cid'].'][]" '.$checked.' value="'.htmlentities($value).'" type="checkbox" />&nbsp;'.html_entity_decode($option['label']).'</label>'; 
				  $counter++; 
			    }
				
				/* Option for other*/
				$checked=(isset($data[$field['cid']]['other']) && $data[$field['cid']]['other'])?'checked':'';
				$element_html   .=(isset($field['field_options']['include_other_option']) && $field['field_options']['include_other_option'])?'<label for="field-'.$field['cid'].'-'.$counter.'"><input id="field-'.$field['cid'].'-'.$counter.'" class="'.$css_class.'" name="data['.$field['cid'].'][other]" '.$checked.' value="1" type="checkbox" />&nbsp;'.$this->language->get('text_xform_other').'</label><input placeholder="'.$this->language->get('text_xform_other_placeholder').'" class="option-other" name="data['.$field['cid'].'][other_value]" value="'.(isset($data[$field['cid']]['other_value'])?$data[$field['cid']]['other_value']:'').'" type="text" />':'';
			    $element_html    .= '</div>';
			  
		   }
		   
		   if($field['field_type']=='radio'){
			 
			    $element_html   .= '<div class="radio-wrapper">';
				 $counter=1;
			    foreach ($field['field_options']['options'] as $inc=>$option){
			      $value=($option['value'])?$option['value']:$option['label'];	 
				  if(!isset($data[$field['cid']]) && $option['checked'])$data[$field['cid']]=	$value; // set initial selection if data is not set
			      $checked=(isset($data[$field['cid']]) && $data[$field['cid']]==$value)?'checked':'';
			      
			      $option['label'] = isset($lang_options[$field['cid'].'_'.$inc])?$lang_options[$field['cid'].'_'.$inc]:$option['label'];
			      $element_html   .= '<label for="field-'.$field['cid'].'-'.$counter.'"><input id="field-'.$field['cid'].'-'.$counter.'" class="'.$css_class.'" name="data['.$field['cid'].']" '.$checked.' value="'.htmlentities($value).'" type="radio" />&nbsp;'.html_entity_decode($option['label']).'</label>'; 
				  $counter++; 
			    }
				
				/* Option for other*/
				$checked=(isset($data[$field['cid']]) && $data[$field['cid']]=='Other'.$field['cid'])?'checked':'';
				$element_html   .=(isset($field['field_options']['include_other_option']) && $field['field_options']['include_other_option'])?'<label for="field-'.$field['cid'].'-'.$counter.'"><input id="field-'.$field['cid'].'-'.$counter.'" class="'.$css_class.'" name="data['.$field['cid'].']" '.$checked.' value="Other'.$field['cid'].'" type="radio" />&nbsp;'.$this->language->get('text_xform_other').'</label><input placeholder="'.$this->language->get('text_xform_other_placeholder').'" class="option-other" name="data[other_value'.$field['cid'].']" value="'.(isset($data['other_value'.$field['cid']])?$data['other_value'.$field['cid']]:'').'" type="text" />':'';
			    $element_html    .= '</div>';
			  
		   }
		   
		   if($field['field_type']=='file'){
			   $element_html   .= '<input id="field-'.$field['cid'].'" class="'.$css_class.'" name="data['.$field['cid'].']" type="file" />';     
		   }
		   
		   if($field['field_type']=='submit'){
			    $css_class.=' btn';
				if($formInfo['successType'] == 'ajax'){
					$element_html   .= '<a id="field-'.$field['cid'].'" class="'.$css_class.' submit">'.(isset($lables[$field['cid']])?$lables[$field['cid']]:'Submit').'</a>';
				}else{
					$element_html   .= '<input id="field-'.$field['cid'].'" class="'.$css_class.'" name="submit" value="'.(isset($lables[$field['cid']])?$lables[$field['cid']]:'Submit').'" type="submit" />'; 
				}
			   
		   }
		   
		   
		    if($field['field_type']=='date'){
			 
			    $element_html   .= '<div class="date-wrapper">';
				
				if($formInfo['dateFormat'] == 'dd/mm/yyyy') {
				   $element_html   .= '<input placeholder="DD" id="field-'.$field['cid'].'" class="'.$css_class.' day" name="data['.$field['cid'].'][day]" value="'.(isset($data[$field['cid']]['day'])?$data[$field['cid']]['day']:'').'" type="text" /> / '; 
				   $element_html   .= '<input placeholder="MM" class="'.$css_class.' month" name="data['.$field['cid'].'][month]" value="'.(isset($data[$field['cid']]['month'])?$data[$field['cid']]['month']:'').'" type="text" /> / '; 
				   $element_html   .= '<input placeholder="YYYY" class="'.$css_class.' year" name="data['.$field['cid'].'][year]" value="'.(isset($data[$field['cid']]['year'])?$data[$field['cid']]['year']:'').'" type="text" />'; 
				}
				else if($formInfo['dateFormat'] == 'yyyy/mm/dd') {
				   $element_html   .= '<input placeholder="YYYY" class="'.$css_class.' year" name="data['.$field['cid'].'][year]" value="'.(isset($data[$field['cid']]['year'])?$data[$field['cid']]['year']:'').'" type="text" /> / ';  
				   $element_html   .= '<input placeholder="DD" id="field-'.$field['cid'].'" class="'.$css_class.' day" name="data['.$field['cid'].'][day]" value="'.(isset($data[$field['cid']]['day'])?$data[$field['cid']]['day']:'').'" type="text" /> / '; 
				   $element_html   .= '<input placeholder="MM" class="'.$css_class.' month" name="data['.$field['cid'].'][month]" value="'.(isset($data[$field['cid']]['month'])?$data[$field['cid']]['month']:'').'" type="text" />'; 
				}
				else {
				   $element_html   .= '<input placeholder="MM" class="'.$css_class.' month" name="data['.$field['cid'].'][month]" value="'.(isset($data[$field['cid']]['month'])?$data[$field['cid']]['month']:'').'" type="text" /> / '; 
				   $element_html   .= '<input placeholder="DD" id="field-'.$field['cid'].'" class="'.$css_class.' day" name="data['.$field['cid'].'][day]" value="'.(isset($data[$field['cid']]['day'])?$data[$field['cid']]['day']:'').'" type="text" /> / '; 
				   $element_html   .= '<input placeholder="YYYY" class="'.$css_class.' year" name="data['.$field['cid'].'][year]" value="'.(isset($data[$field['cid']]['year'])?$data[$field['cid']]['year']:'').'" type="text" />'; 
				}
				
				if($theme!='custom') {
				  $element_html   .= '<input class="xdp" value="" type="text" />'; 
				  $element_html   .= '<button type="button" class="Zebra_DatePicker_Icon Zebra_DatePicker_Icon_Inside_Right xformpicker">Pick a date</button>';
				}
				
				$element_html   .='</div>';
				$dateInput = true;
			}
			
			if($field['field_type']=='time'){
			 
			    $element_html   .= '<div class="time-wrapper">';
				$element_html   .= '<input placeholder="HH" id="field-'.$field['cid'].'" class="'.$css_class.' hour" name="data['.$field['cid'].'][hour]" value="'.(isset($data[$field['cid']]['hour'])?$data[$field['cid']]['hour']:'').'" type="text" />&nbsp;:&nbsp;'; 
				$element_html   .= '<input placeholder="MM" class="'.$css_class.' minute" name="data['.$field['cid'].'][minute]" value="'.(isset($data[$field['cid']]['minute'])?$data[$field['cid']]['minute']:'').'" type="text" /> '; 
				
				$data[$field['cid']]['ampm']=isset($data[$field['cid']]['ampm'])?$data[$field['cid']]['ampm']:'AM';
				$element_html   .= '<select class="'.$css_class.' ampm" name="data['.$field['cid'].'][ampm]"><option '.(($data[$field['cid']]['ampm']=='AM')?'selected':'').' value="AM">'.$this->language->get('text_xform_am').'</option><option '.(($data[$field['cid']]['ampm']=='PM')?'selected':'').' value="PM">'.$this->language->get('text_xform_pm').'</option></select>'; 
				$element_html   .='</div>';
			}
			
			if($field['field_type']=='captcha' && !$isAdmin){
		        $element_html   .= '<input id="field-'.$field['cid'].'" class="'.$css_class.'" name="data['.$field['cid'].']" value="" type="text" />';  
				$element_html   .='<span><img src="index.php?route=xform/xform/captcha" /></span>';
		   }
		   
		   
		   
		   if($field['field_type']=='address') {
			 
			    $element_html   .= '<div class="address-wrapper">';
				$element_html   .= '	<div class="address-line">
								    <input placeholder="'.$this->language->get('text_xform_street').'" id="field-'.$field['cid'].'" class="'.$css_class.' street" name="data['.$field['cid'].'][steet]" value="'.(isset($data[$field['cid']]['steet'])?$data[$field['cid']]['steet']:$addressInfo['address_1']).'" type="text" />
							   </div>';
				
			    $element_html   .= '	<div class="address-line">
								  <input placeholder="'.$this->language->get('text_xform_city').'" class="'.$css_class.' city" name="data['.$field['cid'].'][city]" value="'.(isset($data[$field['cid']]['city'])?$data[$field['cid']]['city']:$addressInfo['city']).'" type="text" />
								 <input placeholder="'.$this->language->get('text_xform_state').'" class="'.$css_class.' state" name="data['.$field['cid'].'][state]" value="'.(isset($data[$field['cid']]['state'])?$data[$field['cid']]['state']:$zoneInfo['name']).'" type="text" />
						      </div>';
						   
		
		        
				
				$data[$field['cid']]['country']=isset($data[$field['cid']]['country'])?$data[$field['cid']]['country']:$countryInfo['name'];
				$element_html   .= '<div class="input-line">
									 <input placeholder="'.$this->language->get('text_xform_zip').'" class="'.$css_class.' zip" name="data['.$field['cid'].'][zip]" value="'.(isset($data[$field['cid']]['zip'])?$data[$field['cid']]['zip']:$addressInfo['postcode']).'" type="text" />
									<select class="'.$css_class.' country" name="data['.$field['cid'].'][country]">';
				foreach($countries as $country) {		
						$element_html   .= '<option value="'.$country['name'].'" '.(($data[$field['cid']]['country']==$country['name'])?'selected':'').'>'.$country['name'].'</option>';
			    }						               
		        $element_html   .=' </select>  </div>';
				$element_html   .='</div>';
			}
		   
		  /*append UI for theme wise*/ 
		  if($theme=='custom') {	
		    $keyword[]= $element_html;
		  } else {
		    $output .= $element_html;
		  }
		   
		   if(isset($lang_guidelines[$field['cid']]) && $lang_guidelines[$field['cid']] && !$field['field_options']['placeholder']) {
		      if($theme=='custom') {	
		         $keyword[] = $lang_guidelines[$field['cid']]; 
		      } else {
			     $output   .= '<span class="help-block">'.$lang_guidelines[$field['cid']].'</span>'; 
			  }    
		   }
		   else {
			  $keyword[] = "";
		   }
		   
		   
		   if(in_array($field['cid'],$this->formError)) {
		   
		     if($theme=='custom') {	
			    $keyword[] = (isset($lang_errors[$field['cid']]) && $lang_errors[$field['cid']])?$lang_errors[$field['cid']]:$formErrorMessage[$field['field_type']]; 
			  } else {
			    
			    $output   .= '<span class="error-block">';
			    $output   .= (isset($lang_errors[$field['cid']]) && $lang_errors[$field['cid']])?$lang_errors[$field['cid']]:$formErrorMessage[$field['field_type']];
				$output   .= '</span>'; 
			  
			  }	
			} 
			else {
			  $keyword[] = "";
			}
			
		  if($theme!='custom') {	
		     $output   .= '</li>';  
		   }
		   
		   if($theme=='custom') {
		     
		     $output = str_replace($placeholder,$keyword, $output);
		   
		   }
		 	
		}
		
		if($theme!='custom') {
	   	  $output   .= '</ul>';
		}
		
		/*calendar script*/
	  if(!$isAdmin && $dateInput) {	
         $output .= '<link href="catalog/view/javascript/xform/datepicker/css/metallic.css" rel="stylesheet">';
         $output .= '<script type="text/javascript" src="catalog/view/javascript/xform/datepicker/js/zebra_datepicker.js"></script>';
         
         $output .= '<script> 
              $(".xdp").Zebra_DatePicker({
                show_icon: false,
    			onSelect: function(date,stFormat,obj,elm) {
    			   var parts = stFormat.split(/-/g);
    			   var dateWrapper = elm.closest(".date-wrapper");
    			   dateWrapper.find("input.year").val(parts[0]);
    			   dateWrapper.find("input.month").val(parts[1]);
    			   dateWrapper.find("input.day").val(parts[2]);
    			}
			  });
			  
			  $(".xformpicker").click(function(e){
			  	 e.preventDefault();
			  	 var dateWrapper = $(this).closest(".date-wrapper");
			  	 var datepicker = dateWrapper.find("input.xdp").data("Zebra_DatePicker");
			  	 
    			 var date = dateWrapper.find("input.year").val()+"-"+dateWrapper.find("input.month").val()+"-"+dateWrapper.find("input.day").val(); 
    			 datepicker.set_date(date);
			  	 datepicker.show();
			  });
			  
          </script>
          <style>
          input.xdp {
    		visibility: hidden;
   		    width: 250px !important;
   			margin: 0 !important;
    		padding: 0 !important;
    		position: absolute;
    		left: 0;
    		top: 0;
   			height: 1px;
		  }
          span.Zebra_DatePicker_Icon_Wrapper {
   			 width: 25px;
    		 height: 21px;
		   }
		   button.xformpicker{
		     display: inline-block;
    		 position: relative;
    		 margin-top: 7px;
    		 margin-left: 5px;
		   }
          </style>
          ';
         
       }
		
		if(!$layout) {
			$output   .= '<input type="hidden" name="form_id" value="'.$formId.'">';
			$output   .= '</form>'; 
			$output   .= '</div>'; 
		}
		
		$xform_ajax = $this->url->link('xform/xform/ajax', '', 'SSL');
		
		if($formInfo['successType'] == 'ajax'){
			$output .= "
			<script type='text/javascript'>
			$(document).delegate('#xform-".$formId." a.submit', 'click', function(event){
				event.preventDefault();
				var action = '".$xform_ajax."';
				var method = $('#xform-".$formId."').attr('method');
				
				$.ajax({
					url: action,
					type: method,
					data: $('#xform-".$formId." input, #xform-".$formId." textarea, #xform-".$formId." select'),
					dataType: 'html',
					success: function(html) {
						var _this = $('#xform-".$formId."').parents('.xform-mod');
						_this.find('.form-wrapper').remove();
						_this.append(html);
					}
				});
			});
			</script>
			";
		}
		
		return $output;
	 }
	 
  public function getErrorDetails($formId, $data) {
     
     $return = array();
     
     
     if(!$this->validateForm($formId,$data)) {
       
       $this->load->language('module/xform');
       
       $errors = $this->formError;
	  
       $language_id=$this->config->get('config_language_id');
       $form_langs = $this->getFormLang($formId, $language_id);
       $lang_errors = $form_langs['errors'];
       
        foreach($errors as $cid) {
           $return[] = array('cid'=>$cid, 'error' => (isset($lang_errors[$cid]) && $lang_errors[$cid])?$lang_errors[$cid]:$this->language->get('error_text'));
        }
     }
     
     return $return;
     
 }	 
	 
  public function getRecordData($formId,$recordId){
	
	  $fields      = $this->getFormFields($formId);
	  
	  $return =array();
	  
	  foreach($fields as $field){ 
		 $recordFieldData = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformrecorddata` WHERE fieldName='".$field['cid']."' and recordId='".(int)$recordId."'")->row;
		 if($recordFieldData) $this->formatViewData($recordFieldData,$return);
	  }
	 
	  return $return; 
   }
   
   public function getFormOptionsLang($formId, $languageId='') {
      
      $return = array();
      $options = array();
      $fields      = $this->getFormFields($formId);
      $languageId= ($languageId)? $languageId : $this->config->get('config_language_id'); 
      
      $langInfo = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformlang` WHERE formId = '" . (int)$formId . "' and languageId = '" . (int)$languageId . "'")->row;
      if($langInfo) {
        if( $langInfo['options'] ) {
           $options= unserialize(base64_decode($langInfo['options']));
        }
      }
     
     foreach($fields as $field){
       if(isset($field['field_options']['options']) && is_array($field['field_options']['options'])) {
         foreach ($field['field_options']['options'] as $inc=>$option){
           if($option['label']) {
              $return[$field['cid'].'_'.$inc] = isset($options[$field['cid'].'_'.$inc])?$options[$field['cid'].'_'.$inc]:$option['label'];
           }
         }
        } 
      }
    
     return $return; 
   }
   
   public function getFormLang ($formId, $languageId='') {
   
      $data_labels = array();
      $data_options = array();
      $data_guidelines = array();
      $data_errors = array();
      
      $labels = array();
      $options = array();
      $guidelines = array();
      $errors = array();
      
      if( !$formId ) return array('labels'=>$labels,'options'=>$options,'guidelines'=>$guidelines);
      
      $fields = $this->getFormFields($formId);
      $languageId= ($languageId)? $languageId : $this->config->get('config_language_id');
      $langInfo = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblformlang` WHERE formId = '" . (int)$formId . "' and languageId = '" . (int)$languageId . "'")->row;
      if($langInfo) {
      
        if( $langInfo['data'] ) {
           $data_labels= unserialize(base64_decode($langInfo['data']));
        }
        
        if( $langInfo['options'] ) {
           $data_options= unserialize(base64_decode($langInfo['options']));
        }
        
         if( $langInfo['guidelines'] ) {
           $data_guidelines= unserialize(base64_decode($langInfo['guidelines']));
          }
         if( $langInfo['errors'] ) {
           $data_errors= unserialize(base64_decode($langInfo['errors']));
          } 
        
      }
      
      $this->load->model('localisation/language');
	  $languages = $this->model_localisation_language->getLanguages();
      
      foreach($fields as $field) {  
        
        //labels
        $labels[$field['cid']] = (isset($data_labels[$field['cid']]) && $data_labels[$field['cid']] && count($languages) > 1)? $data_labels[$field['cid']]:$field['label'];
        
        //options
        if(isset($field['field_options']['options']) && is_array($field['field_options']['options'])) {
            foreach ($field['field_options']['options'] as $inc=>$option){
                if($option['label']) {
                   $options[$field['cid'].'_'.$inc] = (isset($data_options[$field['cid'].'_'.$inc]) && count($languages) > 1)?$data_options[$field['cid'].'_'.$inc]:$option['label'];
                 }
            }
         } 
         
         //guideline
         if(isset($field['field_options']['description']) && $field['field_options']['description']) {
           $guidelines[$field['cid']] = (isset($data_guidelines[$field['cid']]) && $data_guidelines[$field['cid']] && count($languages) > 1)? $data_guidelines[$field['cid']]:$field['field_options']['description'];
         }
         
         //guideline
         if(isset($field['field_options']['error']) && $field['field_options']['error']) {
           $errors[$field['cid']] = (isset($data_errors[$field['cid']]) && $data_errors[$field['cid']] && count($languages) > 1)? $data_errors[$field['cid']]:$field['field_options']['error'];
         }
      }
      
      return array('labels'=>$labels,'options'=>$options,'guidelines'=>$guidelines, 'errors'=>$errors);
       
   }
   
   public function setFormLang($formId, $languageId, $data) {
      
        $this->db->query("DELETE FROM " . DB_PREFIX . "tblformlang WHERE formId = '" . (int)$formId . "' and languageId = '" . (int)$languageId . "'");
		$this->db->query("INSERT INTO " . DB_PREFIX . "tblformlang SET formId = '" . (int)$formId . "', languageId = '" . (int)$languageId . "', data = '" . $this->db->escape($data) . "'");   
   }
      
    public function install(){
        
        $this->log->write('xform Module --> Starting install');
	  
        $sql = " CREATE TABLE IF NOT EXISTS `".DB_PREFIX."tblform` (
            `formId` int(11) NOT NULL AUTO_INCREMENT,
  			`formName` varchar(100) NOT NULL,
  			`hideTitle` int(11) NOT NULL,
  			`formDescription` text NOT NULL,
 			`sendAdminEmail` tinyint(1) NOT NULL,
  			`adminEmail` varchar(240) NOT NULL,
  			`formCreationDate` datetime NOT NULL,
  			`status` int(11) NOT NULL,
  			`adminEmailContent` text NOT NULL,
  			`sendUserEmail` tinyint(1) NOT NULL,
  			`userEmail` varchar(100) NOT NULL,
  			`userEmailContent` text NOT NULL,
  			`successMsg` text NOT NULL,
  			`successType` varchar(50) NOT NULL,
  			`successURL` varchar(240) NOT NULL,
  			`adminEmailSubject` varchar(240) NOT NULL,
  			`userEmailSubject` varchar(240) NOT NULL,
  			`formHeading` text NOT NULL,
  			`keyword` varchar(250) NOT NULL,
  			`theme` varchar(100) NOT NULL,
  			`formModule` tinyint(1) NOT NULL,
  			`custom` TEXT NOT NULL,
  			`script` TEXT NOT NULL,
  			`style` TEXT NOT NULL,
             PRIMARY KEY (`formId`)
           ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;";
        $query = $this->db->query($sql);
       
		 $sql = "
            CREATE TABLE IF NOT EXISTS `".DB_PREFIX."tblformfield` (
               `fieldId` bigint(8) NOT NULL AUTO_INCREMENT,
  			   `formId` int(8) NOT NULL,
  			  `label` varchar(100) NOT NULL,
  			  `hideLabel` tinyint(1) NOT NULL,
  			   `name` varchar(50) NOT NULL,
  		      `fieldType` varchar(100) DEFAULT NULL,
  			  `required` int(11) NOT NULL,
  			  `fieldParam` text NOT NULL,
  			  `sortOrder` int(8) DEFAULT NULL,
  			   PRIMARY KEY (`fieldId`)
             ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
        ";
        $query = $this->db->query($sql);
       	
		$sql = "
            CREATE TABLE IF NOT EXISTS `".DB_PREFIX."tblformrecord` (
            `recordId` bigint(8) NOT NULL AUTO_INCREMENT,
            `formId` bigint(8) DEFAULT NULL,
            `userIP` varchar(100) NOT NULL,
            `userAgent` varchar(240) NOT NULL,
            `submitDate` datetime DEFAULT NULL,
            `storeId` int(10) NOT NULL,
            `userId` int(8) NOT NULL,
  			  PRIMARY KEY (`recordId`)
            ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
        ";
        $query = $this->db->query($sql);  
        
        $sql = "
            CREATE TABLE IF NOT EXISTS `".DB_PREFIX."tblformrecorddata` (
            `recordDataId` bigint(10) NOT NULL AUTO_INCREMENT,
 			`recordId` bigint(10) NOT NULL,
  			`formId` bigint(8) NOT NULL,
  			`fieldType` varchar(100) NOT NULL,
  			`fieldName` varchar(8) NOT NULL,
  			`fieldLabel` varchar(100) NOT NULL,
  			`fieldValue` text NOT NULL,
  			`isSerialize` int(11) NOT NULL,
             PRIMARY KEY (`recordDataId`)
            ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
        ";
        $query = $this->db->query($sql);
        
         $sql = "
            CREATE TABLE IF NOT EXISTS `".DB_PREFIX."tblformlang` (
  				`formLangId` int(10) NOT NULL AUTO_INCREMENT,
  				`formId` int(8) NOT NULL,
 				`languageId` int(5) NOT NULL,
 				`data` longtext NOT NULL,
  				PRIMARY KEY (`formLangId`)
			) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
         ";
        $query = $this->db->query($sql);
        
      /*Insert demo data*/
      $sql ="INSERT INTO `".DB_PREFIX."tblform` (`formId`, `formName`, `hideTitle`, `formDescription`, `sendAdminEmail`, `adminEmail`, `formCreationDate`, `status`, `adminEmailContent`, `sendUserEmail`, `userEmail`, `userEmailContent`, `successMsg`, `successType`, `successURL`, `adminEmailSubject`, `userEmailSubject`, `formHeading`, `formModule`, `keyword`, `theme`, `custom`, `script`, `style`) VALUES
(1, 'Contact Us', 0, 'Your questions and comments are important to us.  Please fill up following form and send to us, We will back to you soon.', 1, 'info@example.com', '2015-07-16 15:44:52', 1, '&lt;p&gt;Hello&lt;/p&gt;&lt;p&gt;Someone has submitted an equerry. Here are info:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;{c2.label} -&amp;nbsp;{c2.value}&lt;/p&gt;&lt;p&gt;{c6.label} -&amp;nbsp;{c6.value}&lt;br&gt;&lt;/p&gt;&lt;p&gt;{c14.label} -&amp;nbsp;{c14.value}&lt;br&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 1, 'c17', '&lt;p&gt;Hello&amp;nbsp;{c2.value},&lt;/p&gt;&lt;p&gt;Thank you for contacting.&lt;/p&gt;&lt;p&gt;{c2.label} -&amp;nbsp;{c2.value}&lt;/p&gt;&lt;p&gt;{c6.label} -&amp;nbsp;{c6.value}&lt;br&gt;&lt;/p&gt;&lt;p&gt;{c14.label} -&amp;nbsp;{c14.value}&lt;br&gt;&lt;/p&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Regards&lt;/div&gt;&lt;div&gt;{formName}&lt;br&gt;&lt;/div&gt;', '&lt;p&gt;Thank you &amp;nbsp;for contacting to us. We have received your equerry. &amp;nbsp;We will back to you soon.&lt;br&gt;&lt;/p&gt;', 'self', '', 'Contact US', 'Thank you for contacting', 'a:3:{s:2:\"c2\";s:9:\"Your Name\";s:3:\"c17\";s:5:\"Email\";s:3:\"c14\";s:7:\"Enquiry\";}', 0, 'Contact_Us', 'boxplus', '', '', '');";
      
       $query = $this->db->query($sql);
       
      $sql = "INSERT INTO `".DB_PREFIX."tblformfield` (`fieldId`, `formId`, `label`, `hideLabel`, `name`, `fieldType`, `required`, `fieldParam`, `sortOrder`) VALUES
		(1, 1, 'Your Name', 0, 'c2', 'text', 1, 'a:1:{s:4:\"size\";s:6:\"medium\";}', 0),
		(2, 1, 'Enquiry', 0, 'c14', 'paragraph', 1, 'a:1:{s:4:\"size\";s:6:\"medium\";}', 2),
		(3, 1, 'Verification Code', 0, 'c18', 'captcha', 1, 'a:0:{}', 3),
		(4, 1, 'Submit', 1, 'c22', 'submit', 0, 'a:0:{}', 4),
		(5, 1, 'Email', 0, 'c17', 'email', 1, 'a:1:{s:4:\"size\";s:6:\"medium\";}', 1);";
		
		$query = $this->db->query($sql);
		
		$sql = "INSERT INTO `".DB_PREFIX."url_alias` (`url_alias_id`, `query`, `keyword`) VALUES('', 'form_id=1', 'Contact_Us');";
		$query = $this->db->query($sql);
        
    }
    
    public function uninstall(){
        
         $this->log->write('xform Module --> Starting uninstall');
	  
         $query = $this->db->query("DROP TABLE IF EXISTS `".DB_PREFIX."tblform`"); 
		 $query = $this->db->query("DROP TABLE IF EXISTS `".DB_PREFIX."tblformfield`");
    	 $query = $this->db->query("DROP TABLE IF EXISTS `".DB_PREFIX."tblformrecord`");
         $query = $this->db->query("DROP TABLE IF EXISTS `".DB_PREFIX."tblformrecorddata`");
         $query = $this->db->query("DROP TABLE IF EXISTS `".DB_PREFIX."tblformlang`");
         $this->log->write('xform Module --> Completed uninstall');
    }
    
    
    /* site*/
    public function getFormStatus($formId) {
       $result= $this->db->query("SELECT * FROM `" . DB_PREFIX . "tblform` WHERE status=1 and formId = '".(int)$formId."'")->row;
	  
	   if(!$result) return false;
	   
	   if($result['customerOnly'] && !$this->customer->isLogged()) return false;
	   
	    $result['storeId']= isset($result['storeId']) && $result['storeId']  ? unserialize($result['storeId']): array();
	    
	    if(empty($result['storeId'])) $result['storeId'] = array(0);
	    
	    if (!in_array($this->config->get('config_store_id'), $result['storeId'])) return false;
	   
	   return true;
    
    }
    
    private function sortArrayByArray($array=array(),$orderArray=array(),$flag='value') {
		
		$ordered = array();
		foreach($orderArray as $key=>$value) {
			if($flag=='value')$key=$value;
			if(array_key_exists($key,$array)) {
				$ordered[$key] = $array[$key];
				unset($array[$key]);
			}
		}
		return $ordered + $array;
    }
    
    private function arrayToCsv($data=array(),$heading=array(), $filename = 'data.csv')
	 {

		$csv_terminated = "\n";
		$csv_separator = ",";
		$csv_enclosed = '"';
		$csv_escaped = "\\";
		$out="";
		foreach($heading as $head)
		{		
			$out .= $csv_enclosed . str_replace($csv_enclosed, $csv_escaped . $csv_enclosed,			
			stripslashes($head)) . $csv_enclosed;			
			$out .= $csv_separator;
		
		} // end for   

		$out= rtrim($out,$csv_separator);		
		$out .= $csv_terminated;
		
		

		// Format the data
		foreach($data as $row)
		{
        	foreach($row as $cell)
        	{
				$out .= $csv_enclosed . str_replace($csv_enclosed, $csv_escaped . $csv_enclosed,			
			           stripslashes($cell)) . $csv_enclosed;			
			    $out .= $csv_separator;
            } 
			
			$out = rtrim($out,$csv_separator);		
		    $out .= $csv_terminated;
			
        } 
      @file_put_contents($filename.'.csv',$out);
      return true;
     }
	
}

?>