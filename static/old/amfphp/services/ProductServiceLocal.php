<?php
//ini_set("include_path", ini_get("include_path") . ":../frameworks");

//include '../../CommeUneFee/administrator/components/com_virtuemart/classes/ps_cart.php';

class ProductService
{

	var $dbh;
	
	public function __construct()
	{
	   $this->dbh = mysql_connect ("localhost", "root", "") or die ('I cannot connect to the database because: ' . mysql_error());
		mysql_select_db ("sitejoomla");
	}
	
	function getProducts()
	{
		return mysql_query(sprintf("SELECT jos_vm_product.product_s_desc, jos_vm_product.product_full_image, jos_vm_product.product_name, jos_vm_product_price.product_price, jos_vm_product.product_sku jos_vm_product.product_publish FROM jos_vm_product, jos_vm_product_price WHERE jos_vm_product.product_id = jos_vm_product_price.product_id"));
	}
	
	function getCoupons()
	{
		return mysql_query(sprintf("SELECT jos_vm_coupons.coupon_code FROM jos_vm_coupons"));
	}
}
?>