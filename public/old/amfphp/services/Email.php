<?php

class Email
{	
	/**
	 * This service sends an email
	 * @returns true or false
	 */
	function send($to, $subject, $message)
	{
		return mail($to, $subject, $message);
	}
}

?>