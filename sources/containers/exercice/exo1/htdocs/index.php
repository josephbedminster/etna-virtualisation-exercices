<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="fr_FR" xml:lang="fr_FR">
<head>
<title>Calculatrice</title>
</head>
<body>
<?php
if (isset($_POST['expr']))
{
	eval("echo ".$_POST['expr'].";");
}
?>
<br />
<form method="post">
<input type="text" name="expr"/>
<input type="submit" />
</form>
</body>
</html>