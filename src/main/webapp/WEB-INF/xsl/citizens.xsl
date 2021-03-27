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

                <title>Citizens</title>
                <link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
            </head>

            <body>
                <div class="container">
                    <h1>CITIZENS   </h1>
                    <xsl:apply-templates />
                    <br/>
                    <hr/>
                    Go to the <a href="/">home</a> page
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="citizens">
        <table border="1" width="70%">
            <tr>
                <th>ID</th>
                <th>SSN</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Role</th>
                <th>Salary</th>
            </tr>
            <xsl:for-each select="citizen">
                <!-- sort by SSN number -->
                <xsl:sort data-type="number" select="salary"/>
                <xsl:if test="salary &gt; 1">
                <tr>
                    <td>
                        <xsl:value-of select="@id" />
                    </td>
                    <td>
                        <xsl:value-of select="ssn" />
                    </td>
                    <td>
                        <xsl:value-of select="firstname" />
                    </td>
                    <td>
                        <xsl:value-of select="lastname" />
                    </td>
                    <td>
                        <xsl:value-of select="role" />
                    </td>
                    <td>
                        <xsl:value-of select="salary" />
                    </td>
                </tr>
                </xsl:if>
            </xsl:for-each>
        </table>

        <br/>

        <xsl:variable name="totalCitizens">
            <xsl:value-of select="count(/citizens/citizen)"/>
        </xsl:variable>
        <xsl:text>Count:</xsl:text><xsl:text> </xsl:text><xsl:value-of select="$totalCitizens" />

        <xsl:variable name="totalSalary">
            <xsl:value-of select="sum(/citizens/citizen/salary)"/>
        </xsl:variable>

        <xsl:text>. Total salary (</xsl:text>
        <xsl:for-each select="citizen">
            <xsl:value-of select="salary"/>
            <xsl:choose>
                <xsl:when test="not(position()=last())">
                    <xsl:text> + </xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
        <xsl:text>): </xsl:text> <xsl:value-of select="$totalSalary" />
        <br/>

        <xsl:text>Names: </xsl:text>
        <xsl:for-each select="citizen">
            <xsl:variable name="name">
                <xsl:value-of select="firstname"/> <xsl:text> </xsl:text><xsl:value-of select="lastname"/>
            </xsl:variable>
            <xsl:value-of select="$name"/>
            <xsl:if test="not(position()=last())">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>

        
    </xsl:template>
</xsl:stylesheet>