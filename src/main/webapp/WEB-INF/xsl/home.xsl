<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>

                <script src="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script src="/webjars/jquery/3.2.1/jquery.min.js"></script>
                
                <title>POC XSLT transformations</title>
                <link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
            </head>

            <body>
                <div class="container">
                    <br/>
                    <xsl:apply-templates />
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="home">
            <h1>POC XSL transformation</h1>
            Go to the <a href="/citizens">citizens table</a>
    </xsl:template>
</xsl:stylesheet>