<?xml version="1.0" encoding="utf-8"?>
<!--
Nmap Bootstrap XSL
This software must not be used by military or secret service organisations.
Andreas Hontzia (@honze_net) & LRVT (@l4rm4nd)
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta name="referrer" content="no-referrer"/> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.dataTables.min.css" integrity="sha384-0OeHd2TJxoSDnW9bOIukOL7+BcfI6b17OHv54+JWrUbWq7ABgBO0rjW3OinB5vbG" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" type="text/css" integrity="sha384-VEpVDzPR2x8NbTDZ8NFW4AWbtT2g/ollEzX/daZdW/YvUBlbgVtsxMftnJ84k0Cn" crossorigin="anonymous"/>

        <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha384-fJU6sGmyn07b+uD1nMk7/iSb4yvaowcueiQhfVgQuD98rfva8mcr1eSvjchfpMrH" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" integrity="sha384-rgWRqC0OFPisxlUvl332tiM/qmaNxnlY46eksSZD84t+s2vZlqGeHrncwIRX7CGp" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js" integrity="sha384-v9EFJbsxLXyYar8TvBV8zu5USBoaOC+ZB57GzCmQiWfgDIjS+wANZMP5gjwMLwGv" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js" integrity="sha384-HUHsYVOhSyHyZRTWv8zkbKVk7Xmg12CCNfKEUJ7cSuW/22Lz3BITd3Om6QeiXICb" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js" integrity="sha384-UAA3vlTPq9dwxB61awBFhR7Y5uBFOKQWuZueu4C6uI48gjIoqI/OTmYWEYWZXbGR" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js" integrity="sha384-MGimb05YiSGNcXiLlj03UNahXBECHmFTe5iVBqh6sf2G7ccabI3/EOqzBnNw97/T" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js" integrity="sha384-pp2ArcKo71umWphZ7QCCjQbnICkbOkLF88ZeoeZDPbqdAVvxZlcrla3lyT7pY/ue" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.colVis.min.js" integrity="sha384-enGTgEZOvC7C8P91Jt/27n1V3xD5SIzGi1e+DzYJvAts546YTsj3CNmnL0G/zlVn" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.bootstrap.min.js" integrity="sha384-Ndtz/aMKkdc9b0uTCirKXA6kJ8QfBTv73Ph9sv0wOiqK7NENdLN+qTpPX5skuhiM" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js" integrity="sha384-7PXRkl4YJnEpP8uU4ev9652TTZSxrqC8uOpcV1ftVEC7LVyLZqqDUAaq+Y+lGgr9" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <style>

          .target:before {
            content: "";
            display: block;
            height: 50px;
            margin: -20px 0 0;
          }
          @media only screen and (min-width:1900px) {
            .container {
              width: 1800px;
              }
          }
          .footer {
            margin-top:60px;
            padding-top:60px;
            width: 100%;
            height: 180px;
            background-color: #f5f5f5;
          }
          .clickable {
            cursor: pointer;
          }
          .panel-heading > h3:before {
            font-family: 'Glyphicons Halflings';
            content: "\e114"; /* glyphicon-chevron-down */
            padding-right: 1em;
          }
          .panel-heading.collapsed > h3:before {
            content: "\e080"; /* glyphicon-chevron-right */
          }
        </style>
        <title>Nmap Results</title>
      </head>
      <body>
        <script>
          function highlight(){
              $("#table-services").dataTable().fnDestroy()
              let keywords = document.getElementById('keyword-input').value.split(',');
              let content = document.getElementById('table-services').innerHTML;
              document.getElementById('table-services').innerHTML = transformContent(content, keywords)
              $('#table-services').DataTable( {
              "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
              "order": [[ 0, 'desc' ]],
              "columnDefs": [
                { "targets": [0], "orderable": true },
              ],
              dom:'lfrtiBp', 
              stateSave: true,
              buttons: [
                  {
                      extend: 'copyHtml5',
                      exportOptions: { orthogonal: 'export' }
                  },
                  {
                      extend: 'csvHtml5',
                      exportOptions: { orthogonal: 'export' }
                  },
                  {
                      extend: 'excelHtml5',
                      exportOptions: { orthogonal: 'export' },
                      autoFilter: true,
                  },
                  {
                      extend: 'pdfHtml5',
                      exportOptions: { orthogonal: 'export' },
                      orientation: 'landscape',
                      pageSize: 'LEGAL',
                      download: 'open',
                      exportOptions: {
                      columns: [ 0,1,2,3,4,5,6,7,8 ]
                }
                  }
              ],
            });
          }

          function transformContent(content, keywords){
            let temp = content

            keywords.forEach(keyword => {
              temp = temp.replace(new RegExp(keyword, 'ig'), wrapKeywordWithHTML(keyword, keyword))
            })

            return temp
          }

          function wrapKeywordWithHTML(keyword, url){
            return `<span style="color: red;">${keyword}</span>`
          }
        </script>
        <nav class="navbar navbar-default navbar-fixed-top">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"></span></a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li><a href="#scannedhosts">Scanned Hosts</a></li>
                <li><a href="#openservices">Open Services</a></li>
                <li><a href="#webservices">Web Services</a></li>
                <li><a href="#onlinehosts">Online Hosts</a></li>
                <li><a href="#" style="pointer-events: none; cursor: default;">|</a></li>
                <li><a href="https://www.pentestfactory.de/schwachstellendatenbank/" target="_blank" title="Vulnerability Database by Pentest Factory"><span class="glyphicon glyphicon-new-window " style="color: #f7a90a;"></span> Search CVEs</a></li>
                <li><a href="https://www.ssllabs.com/ssltest/" target="_blank" title="SSL Server Test by Qualys"><span class="glyphicon glyphicon-new-window" style="color: #de1d0b;"></span> Test SSL</a></li>
                <li><a href="https://securityheaders.com/" target="_blank" title="HTTP Header Test by Scott Helme"><span class="glyphicon glyphicon-new-window" style="color: #3a71d8;"></span> Test HTTP Headers</a></li>
                <li><a href="#" style="pointer-events: none; cursor: default;">|</a></li>
                <li><a href="#" onclick="document.location.reload(true);">Reset</a></li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="container" style="width: 94%">
          <div class="jumbotron" style="margin-top: 80px; padding-top: 15px; padding-bottom: 15px; padding-left: 30px; padding-right: 30px">
            <img src="data:image/png;base64,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" style="margin-left: auto; margin-top: 10px; display: block;" width="100px"/>
            <h2 style="margin-top: -100px">Portscan Results</h2>
            <h2><small>Nmap Version <xsl:value-of select="/nmaprun/@version"/> | Bootstrap by <a style="color: inherit" href="https://github.com/l4rm4nd" target="_blank">LRVT</a>
            <br/><xsl:value-of select="/nmaprun/@startstr"/> – <xsl:value-of select="/nmaprun/runstats/finished/@timestr"/></small></h2>
            <pre style="white-space:pre-wrap; word-wrap:break-word;"><a target="_blank"><xsl:attribute name="href">https://explainshell.com/explain?cmd=<xsl:value-of select="/nmaprun/@args"/></xsl:attribute><xsl:value-of select="/nmaprun/@args"/></a></pre>
            <p class="lead">
              <xsl:value-of select="/nmaprun/runstats/hosts/@total"/> hosts scanned.
              <xsl:value-of select="/nmaprun/runstats/hosts/@up"/> hosts up.
              <xsl:value-of select="/nmaprun/runstats/hosts/@down"/> hosts down.
            </p>
            <div class="progress">
              <div class="progress-bar progress-bar-success" style="width: 0%">
                <xsl:attribute name="style">width:<xsl:value-of select="/nmaprun/runstats/hosts/@up div /nmaprun/runstats/hosts/@total * 100"/>%;</xsl:attribute>
                <xsl:value-of select="/nmaprun/runstats/hosts/@up"/>
                <span class="sr-only"></span>
              </div>
              <div class="progress-bar progress-bar-danger" style="width: 0%">
                <xsl:attribute name="style">width:<xsl:value-of select="/nmaprun/runstats/hosts/@down div /nmaprun/runstats/hosts/@total * 100"/>%;</xsl:attribute>
                <xsl:value-of select="/nmaprun/runstats/hosts/@down"/>
                <span class="sr-only"></span>
              </div>
              </div>
              <div id="form-wrapper">
                <div>
                    <textarea style="width: 100%;" title="Insert comma separated keywords to be highlighted" rows = "1" name = "keywords" placeholder="sha1,password,..." id="keyword-input">sha1,login,password,md5</textarea>
                </div>
                <div>
                    <button title="Keyword highlighing in 'Open Services'" id="highlight-button" onclick="highlight()">Highlight Keywords</button>
                </div>
            </div>
          </div>
          <h2 id="scannedhosts" class="target">Scanned Hosts<xsl:if test="/nmaprun/runstats/hosts/@down > 1024"><small> (offline hosts are hidden)</small></xsl:if></h2>
          <div class="table-responsive">
            <table id="table-overview" class="table table-striped dataTable" role="grid">
              <thead>
                <tr>
                  <th>State</th>
                  <th>Address</th>
                  <th>Hostname</th>
                  <th>TCP (open)</th>
                  <th>UDP (open)</th>
                </tr>
              </thead>
              <tbody>
                <xsl:choose>
                  <xsl:when test="/nmaprun/runstats/hosts/@down > 1024">
                    <xsl:for-each select="/nmaprun/host[status/@state='up']">
                      <tr>
                        <td><span class="label label-danger"><xsl:if test="status/@state='up'"><xsl:attribute name="class">label label-success</xsl:attribute></xsl:if><xsl:value-of select="status/@state"/></span></td>
                        <td><a><xsl:attribute name="href">#onlinehosts-<xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute><xsl:value-of select="address/@addr"/></a></td>
                        <td><xsl:value-of select="hostnames/hostname/@name"/></td>
                        <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='tcp'])"/></td>
                        <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='udp'])"/></td>
                      </tr>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:for-each select="/nmaprun/host">
                      <tr>
                        <td><span class="label label-danger"><xsl:if test="status/@state='up'"><xsl:attribute name="class">label label-success</xsl:attribute></xsl:if><xsl:value-of select="status/@state"/></span></td>
                        <td><a><xsl:attribute name="href">#onlinehosts-<xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute><xsl:value-of select="address/@addr"/></a></td>
                        <td><xsl:value-of select="hostnames/hostname/@name"/></td>
                        <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='tcp'])"/></td>
                        <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='udp'])"/></td>
                      </tr>
                    </xsl:for-each>
                  </xsl:otherwise>
                </xsl:choose>
              </tbody>
            </table>
          </div>
          <h2 id="openservices" class="target">Open Services</h2>
          <div class="table-responsive">
            <table id="table-services" class="table table-striped dataTable" role="grid">
              <thead >
                <tr>
                  <!--<th title="Temporary Checkbox"></th>-->
                  <th>Hostname</th>
                  <th>Address</th>
                  <th>Port</th>
                  <th>Protocol</th>
                  <th>Service</th>
                  <th>Product</th>
                  <th>Version</th>
                  <th>Extra</th>
                  <th>SSL Certificate</th>
                  <th title="Title of HTTP services">Title</th>
                  <th>CPE</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="/nmaprun/host">
                  <xsl:for-each select="ports/port[state/@state='open']">
                    <tr>
                      <!--<td><input name="select_all" value="1" type="checkbox"></input></td>-->
                      <td>
                      <xsl:if test="count(../../hostnames/hostname) = 0">N/A</xsl:if>
                      <xsl:if test="count(../../hostnames/hostname) > 0"><xsl:value-of select="../../hostnames/hostname/@name"/></xsl:if></td>
                      <td><a>
                      <xsl:attribute name="href">#onlinehosts-<xsl:value-of select="translate(../../address/@addr, '.', '-')"/></xsl:attribute><xsl:value-of select="../../address/@addr"/></a></td>
                      
                      <td><a>
                      <xsl:attribute name="href">#port-<xsl:value-of select="translate(../../address/@addr, '.', '-')"/>-<xsl:value-of select="@portid"/></xsl:attribute><xsl:value-of select="@portid"/></a></td>
                      <td><xsl:value-of select="@protocol"/></td>
                      <td><xsl:if test="count(service/@tunnel) > 0"><xsl:value-of select="service/@tunnel"/>/</xsl:if><xsl:value-of select="service/@name"/></td>
                      <td><xsl:value-of select="service/@product"/></td>
                      <td><xsl:value-of select="service/@version"/></td>
                      <td><xsl:value-of select="service/@extrainfo"/></td>
                      <td>
                        <xsl:if test="count(script/table[@key='subject']/elem[@key='commonName']) > 0">CN: <i><xsl:value-of select="script/table[@key='subject']/elem[@key='commonName']"/></i></xsl:if>
                        <xsl:if test="count(script/table[@key='validity']/elem[@key='notAfter']) > 0"><br/>Expiry: <i><xsl:value-of select="script/table[@key='validity']/elem[@key='notAfter']"/></i></xsl:if>
                        <xsl:if test="count(script/elem[@key='sig_algo']) > 0"><br/>SigAlgo: <i><xsl:value-of select="script/elem[@key='sig_algo']"/></i></xsl:if>
                      </td>
                      <td><xsl:choose><xsl:when test="count(script[@id='http-title']/elem[@key='title']) > 0"><i><xsl:value-of select="script[@id='http-title']/elem[@key='title']"/></i></xsl:when><xsl:otherwise><xsl:if test="count(script[@id='http-title']/@output) > 0"><i><xsl:value-of select="script[@id='http-title']/@output"/></i></xsl:if></xsl:otherwise></xsl:choose></td>
                      <td><xsl:value-of select="service/cpe"/></td>
                    </tr>
                  </xsl:for-each>
                </xsl:for-each>
              </tbody>
            </table>
          </div>

          <h2 id="webservices" class="target">Web Services</h2>
          <div class="table-responsive">
            <table id="web-services" class="table table-striped dataTable" role="grid">
              <thead >
                <tr>
                  <!--<th title="Temporary Checkbox"></th>-->
                  <th>Hostname</th>
                  <th>Address</th>
                  <th>Port</th>
                  <th>Service</th>
                  <th>Produkt</th>
                  <th>Version</th>
                  <th>Title</th>
                  <th>SSL Certificate</th>
                  <th>URL</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="/nmaprun/host">
                  <xsl:for-each select="ports/port[starts-with(service/@name, 'http') and state/@state='open']">

                    <tr>
                      <!--<td><input name="select_all" value="1" type="checkbox"></input></td>-->
                      <td>
                      <xsl:if test="count(../../hostnames/hostname) = 0">N/A</xsl:if>
                      <xsl:if test="count(../../hostnames/hostname) > 0"><xsl:value-of select="../../hostnames/hostname/@name"/></xsl:if></td>
                      <td><a>
                      <xsl:attribute name="href">#onlinehosts-<xsl:value-of select="translate(../../address/@addr, '.', '-')"/></xsl:attribute><xsl:value-of select="../../address/@addr"/></a></td>
                      
                      <td><a>
                      <!--PORT-->
                      <xsl:attribute name="href">#port-<xsl:value-of select="translate(../../address/@addr, '.', '-')"/>-<xsl:value-of select="@portid"/></xsl:attribute><xsl:value-of select="@portid"/></a></td>
                      <!--Service-->
                      <td><xsl:if test="count(service/@tunnel) > 0"><xsl:value-of select="service/@tunnel"/>/</xsl:if><xsl:value-of select="service/@name"/></td>
                      <td><xsl:value-of select="service/@product"/></td>
                      <td><xsl:value-of select="service/@version"/></td>
                      <!--Title-->
                      <td><xsl:choose><xsl:when test="count(script[@id='http-title']/elem[@key='title']) > 0"><i><xsl:value-of select="script[@id='http-title']/elem[@key='title']"/></i></xsl:when><xsl:otherwise><xsl:if test="count(script[@id='http-title']/@output) > 0"><i><xsl:value-of select="script[@id='http-title']/@output"/></i></xsl:if></xsl:otherwise></xsl:choose></td>
                      <!--SSL Cert-->
                      <td>
                        <xsl:if test="count(script/table[@key='subject']/elem[@key='commonName']) > 0">CN: <i><xsl:value-of select="script/table[@key='subject']/elem[@key='commonName']"/></i></xsl:if>
                        <xsl:if test="count(script/table[@key='validity']/elem[@key='notAfter']) > 0"><br/>Expiry: <i><xsl:value-of select="script/table[@key='validity']/elem[@key='notAfter']"/></i></xsl:if>
                        <xsl:if test="count(script/elem[@key='sig_algo']) > 0"><br/>SigAlgo: <i><xsl:value-of select="script/elem[@key='sig_algo']"/></i></xsl:if>
                      </td>
                      <!--URL-->
                      <xsl:choose>
                        <!-- when SSL -->
                        <xsl:when test="count(service/@tunnel) > 0 or service/@name = 'https' or service/@name = 'https-alt'">
                              <td>
                                <xsl:if test="count(../../hostnames/hostname) > 0"><a target="_blank" href="https://{../../hostnames/hostname/@name}:{@portid}"><xsl:value-of select="actionUrl"/>https://<xsl:value-of select="../../hostnames/hostname/@name"/>:<xsl:value-of select="@portid"/></a></xsl:if>
                                <xsl:if test="count(../../hostnames/hostname) = 0"><a target="_blank" href="https://{../../address/@addr}:{@portid}"><xsl:value-of select="actionUrl"/>https://<xsl:value-of select="../../address/@addr"/>:<xsl:value-of select="@portid"/></a></xsl:if>
                              </td>
                        </xsl:when>
                        <!-- when not SSL -->
                        <xsl:otherwise>
                              <td>
                                <xsl:if test="count(../../hostnames/hostname) > 0"><a target="_blank" href="http://{../../hostnames/hostname/@name}:{@portid}"><xsl:value-of select="actionUrl"/>http://<xsl:value-of select="../../hostnames/hostname/@name"/>:<xsl:value-of select="@portid"/></a></xsl:if>
                                <xsl:if test="count(../../hostnames/hostname) = 0"><a target="_blank" href="http://{../../address/@addr}:{@portid}"><xsl:value-of select="actionUrl"/>http://<xsl:value-of select="../../address/@addr"/>:<xsl:value-of select="@portid"/></a></xsl:if>
                              </td>
                        </xsl:otherwise>
                    </xsl:choose>

                    </tr>
                  </xsl:for-each>
                </xsl:for-each>
              </tbody>
            </table>
          </div>

          <h2 id="onlinehosts" class="target">Online Hosts</h2>
          <xsl:for-each select="/nmaprun/host[status/@state='up']">
            <div class="panel panel-default">
              <div class="panel-heading clickable" data-toggle="collapse">
                  <xsl:attribute name="id">onlinehosts-<xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute>
                  <xsl:attribute name="data-target">#<xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute>
                <h3 class="panel-title"><xsl:value-of select="address/@addr"/><xsl:if test="count(hostnames/hostname) > 0"> - <xsl:value-of select="hostnames/hostname/@name"/></xsl:if></h3>
              </div>
              <div class="panel-body collapse in">
                <xsl:attribute name="id"><xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute>
                <xsl:if test="count(hostnames/hostname) > 0">
                  <h4>Hostnames</h4>
                  <ul>
                    <xsl:for-each select="hostnames/hostname">
                      <li><xsl:value-of select="@name"/> (<xsl:value-of select="@type"/>)</li>
                    </xsl:for-each>
                  </ul>
                </xsl:if>
                <h4>Ports</h4>
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>Port</th>
                        <th>Protocol</th>
                        <th>State<br/>Reason</th>
                        <th>Service</th>
                        <th>Product</th>
                        <th>Version</th>
                        <th>Extra Info</th>
                      </tr>
                    </thead>
                    <tbody>
                      <xsl:for-each select="ports/port">
                        <xsl:choose>
                          <xsl:when test="state/@state = 'open'">
                            <tr class="success">
                              <td title="Port"><xsl:attribute name="id">port-<xsl:value-of select="translate(../../address/@addr, '.', '-')"/>-<xsl:value-of select="@portid"/></xsl:attribute><xsl:value-of select="@portid"/></td>
                              <td title="Protocol"><xsl:value-of select="@protocol"/></td>
                              <td title="State / Reason"><xsl:value-of select="state/@state"/><br/><xsl:value-of select="state/@reason"/></td>
                              <td title="Service"><xsl:if test="count(service/@tunnel) > 0"><xsl:value-of select="service/@tunnel"/>/</xsl:if><xsl:value-of select="service/@name"/></td>
                              <td title="Product"><xsl:value-of select="service/@product"/></td>
                              <td title="Version"><xsl:value-of select="service/@version"/></td>
                              <td title="Extra Info"><xsl:value-of select="service/@extrainfo"/></td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <a><xsl:attribute name="href">https://nvd.nist.gov/vuln/search/results?form_type=Advanced&amp;cves=on&amp;cpe_version=<xsl:value-of select="service/cpe"/></xsl:attribute><xsl:value-of select="service/cpe"/></a>
                                <xsl:for-each select="script">
                                  <h5><xsl:value-of select="@id"/></h5>
                                  <pre style="white-space:pre-wrap; word-wrap:break-word;"><xsl:value-of select="@output"/></pre>
                                </xsl:for-each>
                              </td>
                            </tr>
                          </xsl:when>
                          <xsl:when test="state/@state = 'filtered'">
                            <tr class="warning">
                              <td><xsl:value-of select="@portid"/></td>
                              <td><xsl:value-of select="@protocol"/></td>
                              <td><xsl:value-of select="state/@state"/><br/><xsl:value-of select="state/@reason"/></td>
                              <td><xsl:value-of select="service/@name"/></td>
                              <td><xsl:value-of select="service/@product"/></td>
                              <td><xsl:value-of select="service/@version"/></td>
                              <td><xsl:value-of select="service/@extrainfo"/></td>
                            </tr>
                          </xsl:when>
                          <xsl:when test="state/@state = 'closed'">
                            <tr class="active">
                              <td><xsl:value-of select="@portid"/></td>
                              <td><xsl:value-of select="@protocol"/></td>
                              <td><xsl:value-of select="state/@state"/><br/><xsl:value-of select="state/@reason"/></td>
                              <td><xsl:value-of select="service/@name"/></td>
                              <td><xsl:value-of select="service/@product"/></td>
                              <td><xsl:value-of select="service/@version"/></td>
                              <td><xsl:value-of select="service/@extrainfo"/></td>
                            </tr>
                          </xsl:when>
                          <xsl:otherwise>
                            <tr class="info">
                              <td><xsl:value-of select="@portid"/></td>
                              <td><xsl:value-of select="@protocol"/></td>
                              <td><xsl:value-of select="state/@state"/><br/><xsl:value-of select="state/@reason"/></td>
                              <td><xsl:value-of select="service/@name"/></td>
                              <td><xsl:value-of select="service/@product"/></td>
                              <td><xsl:value-of select="service/@version"/></td>
                              <td><xsl:value-of select="service/@extrainfo"/></td>
                            </tr>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </div>
                <xsl:if test="count(hostscript/script) > 0">
                  <h4>Host Script</h4>
                </xsl:if>
                <xsl:for-each select="hostscript/script">
                  <h5><xsl:value-of select="@id"/></h5>
                  <pre style="white-space:pre-wrap; word-wrap:break-word;"><xsl:value-of select="@output"/></pre>
                </xsl:for-each>
                <xsl:if test="count(os/osmatch) > 0">
                  <h4>OS Detection</h4>
                  <xsl:for-each select="os/osmatch">
                    <h5>OS details: <xsl:value-of select="@name"/> (<xsl:value-of select="@accuracy"/>%)</h5>
                    <xsl:for-each select="osclass">
                      Device type: <xsl:value-of select="@type"/><br/>
                      Running: <xsl:value-of select="@vendor"/><xsl:text> </xsl:text><xsl:value-of select="@osfamily"/><xsl:text> </xsl:text><xsl:value-of select="@osgen"/> (<xsl:value-of select="@accuracy"/>%)<br/>
                      OS CPE: <a><xsl:attribute name="href">https://nvd.nist.gov/vuln/search/results?form_type=Advanced&amp;cves=on&amp;cpe_version=<xsl:value-of select="cpe"/></xsl:attribute><xsl:value-of select="cpe"/></a>
                      <br/>
                    </xsl:for-each>
                    <br/>
                  </xsl:for-each>
                </xsl:if>
              </div>
            </div>
          </xsl:for-each>
        </div>
        <footer class="footer">
          <div class="container">
            <p class="text-muted">
              This report was generated by or with the help of <a href="https://pentestfactory.com">Pentest Factory GmbH</a>.<br/>
              If you have questions or problems do not hesitate <a href="mailto:team@pentestfactory.de">contacting us</a>.<br/><br/>
              <span class="glyphicon glyphicon-heart" style="color: #de1d0b;"></span> Bootstrap Template by <a href="https://github.com/honze-net/nmap-bootstrap-xsl" target="_blank">Andreas Hontzia</a><br/>
              <span class="glyphicon glyphicon-heart" style="color: #de1d0b;"></span> Tweaks and Extensions by <a href="https://github.com/l4rm4nd">LRVT</a>
            </p>
          </div>
        </footer>
        <script>
          $(document).ready(function() {
            $('#table-services').DataTable();
            $("a[href^='#onlinehosts-']").click(function(event){     
                event.preventDefault();
                $('html,body').animate({scrollTop:($(this.hash).offset().top-60)}, 500);
            });
          });
          $('#table-services').DataTable( {
            "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
            "order": [[ 0, 'desc' ]],
            "columnDefs": [
              { "targets": [0], "orderable": true },
            ],
            dom:'lfrtiBp', 
            stateSave: true,
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: { orthogonal: 'export' }
                },
                {
                    extend: 'csvHtml5',
                    exportOptions: { orthogonal: 'export' }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: { orthogonal: 'export' },
                    autoFilter: true,
                },
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    pageSize: 'LEGAL',
                    download: 'open',
                    exportOptions: {
                      columns: [ 0,1,2,3,4,5,6,7,8 ]
                    }
                }
            ],
          });
        </script>
        <script>
          $(document).ready(function() {
            $('#web-services').DataTable();
          });
          $('#web-services').DataTable( {
            "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
            "order": [[ 0, 'desc' ]],
            "columnDefs": [
              { "targets": [0], "orderable": true },
            ],
            dom:'lfrtiBp', 
            stateSave: true,
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: { orthogonal: 'export' }
                },
                {
                    extend: 'csvHtml5',
                    exportOptions: { orthogonal: 'export' }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: { orthogonal: 'export' },
                    autoFilter: true,
                },
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    pageSize: 'LEGAL',
                    download: 'open',
                    exportOptions: {
                      columns: [ 0,1,2,3,4,5,6,7,8 ]
                    }
                }
            ],
          });
        </script>
        <script>
          $(document).ready(function() {
            $('#table-overview').DataTable();
          });
          $('#table-overview').DataTable( {
            "lengthMenu": [ [5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"] ],
          });
        </script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
