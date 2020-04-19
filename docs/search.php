<!DOCTYPE HTML>
<? 
$string = trim($_POST['search']) ;
$output = "";
$searched = "";

$dir = new DirectoryIterator('.development/js/data');
foreach ($dir as $file) {
	$searched .= "Searched in " . $file->getPathname() . "<br>";
    $content = file_get_contents($file->getPathname());
    if (strpos($content, $string) !== false) {
        $output .= '<a href="' . $file->getPathname() . '">' . $file->getPathname() . "</a><br>";
    }
}
 ?>
<html>
  <body>
  	<?= $searched; ?><br>
  	<h2>Found <?= $string; ?></h2>
  	<?= $output; ?>
  </body>
 </html>