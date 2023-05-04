<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin_model extends CI_Model {

   public function areaChart() {
   
      $query =  $this->db->query("SELECT COUNT(id) as count,MONTHNAME(date) as month_name,year(date) as year, month(date) bulan FROM posting  GROUP BY year(date),month(date) ,monthname(date) order by 3 DESC,4 DESC limit 5"); 
 
	$record = $query->result();
	
      $data = [];
 
      foreach($record as $row) {
            $data['label'][] = $row->month_name.' '.$row->year;
            $data['data'][] = (int) $row->count;
      }
      
      $result = json_encode($data);
      return $result;
    }

    public function pieChart() {
	$query =  $this->db->query("SELECT jumlah_umkm,rw from view_rw");
	$record = $query->result();
	
	$data = [];
 
	foreach($record as $row) {
		$data['label'][] = "RW ".$row->rw." ";
		$data['data'][] = (int) $row->jumlah_umkm;
	}
	
	$result = json_encode($data);
	return $result;
    }
}

/* End of file Admin_model.php */
