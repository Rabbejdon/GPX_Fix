$root = "C:\Users\ASUS\Documents\GPX-Fixer"
$l = New-Object System.Net.HttpListener
$l.Prefixes.Add("http://localhost:8731/")
$l.Start()
while ($l.IsListening) {
  try {
    $c = $l.GetContext()
    $p = $c.Request.Url.LocalPath.TrimStart("/")
    if ($p -eq "") { $p = "index.html" }
    $f = Join-Path $root $p
    if (Test-Path $f -PathType Leaf) {
      $b = [System.IO.File]::ReadAllBytes($f)
      if ($f -match "\.html$") { $c.Response.ContentType = "text/html; charset=utf-8" }
      elseif ($f -match "\.gpx$") { $c.Response.ContentType = "application/gpx+xml; charset=utf-8" }
      $c.Response.OutputStream.Write($b, 0, $b.Length)
    } else { $c.Response.StatusCode = 404 }
    $c.Response.Close()
  } catch { }
}
