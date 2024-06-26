<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:uom="https://cls-schemas.s3.us-west-1.amazonaws.com/UOM_Database"
xmlns:mtc="https://cls-schemas.s3.us-west-1.amazonaws.com/MetrologyTaxonomyCatalog">

    <xsl:template match="mtc:Taxonomy">
        <html>
            <link rel="stylesheet" href="metrologytaxonomy.css" />
            <body>
                <h2>NRC Metrology Taxonomy</h2>
                <h4>Click on a Taxon to view the details.  Hit Crtl+F to search for a Taxon Name</h4>
                <ul class="taxon-list">
                    <xsl:for-each select="mtc:Taxon">
                        <li>
                            <a href="#" class="taxon">
                                <xsl:value-of select="@name"/>
                                <xsl:if test="@deprecated = 'true'">
                                    <span style="font-weight: bold">&#160;(Deprecated)</span>
                                </xsl:if>
                            </a>
                            <div class="hide-details">
                                <xsl:if test="@deprecated = 'true'">
                                    <p>
                                        Replacement&#58;&#160;<xsl:value-of select="@replacement"/>
                                    </p>
                                </xsl:if>
                                <span style="font-weight: bold; text-decoration: underline">Definition</span>
                                <p>
                                    <xsl:value-of select="mtc:Definition"/>
                                </p>
                                <br/>
                                <span style="font-weight: bold; text-decoration: underline">Parameters</span>
                                <br/>
                                <xsl:for-each select="mtc:Parameter">
                                    <p>
                                        <span>
                                            Name&#58;&#160;<xsl:value-of select="@name"/>
                                        </span>
                                        <xsl:if test="mtc:Definition != ''">
                                            <span>
                                                &#160;&#8208;&#160;<xsl:value-of select="mtc:Definition"/>
                                            </span>
                                        </xsl:if>
                                        <xsl:if test="@optional = 'true'">
                                            <span style="font-weight: bold">&#160;(Optional)</span>
                                        </xsl:if>
                                        <br/>
                                        <xsl:if test="uom:Quantity">
                                            <span>
                                                Quantity&#58;&#160;<xsl:value-of select="uom:Quantity/@name"/>
                                            </span>
                                        </xsl:if>
                                    </p>
                                </xsl:for-each>
                                <br/>
                                <span style="font-weight: bold; text-decoration: underline">Results</span>
                                <xsl:for-each select="mtc:Result">
                                    <p>
                                        <span>
                                            Name&#58;&#160;<xsl:value-of select="@name"/>
                                        </span>
                                        <br/>
                                        <xsl:if test="uom:Quantity">
                                            <span>
                                                Quantity&#58;&#160;<xsl:value-of select="uom:Quantity/@name"/>
                                            </span>
                                        </xsl:if>
                                    </p>
                                </xsl:for-each>
                                <xsl:if test="mtc:Discipline">
                                    <br/>
                                    <span style="font-weight: bold; text-decoration: underline">Discipline</span>
                                    <p>
                                        <xsl:value-of select="mtc:Discipline/@name"/>
                                    </p>
                                    <xsl:if test="mtc:Discipline/mtc:SubDiscipline">
                                        <span style="font-weight: bold;">Sub Disciplines</span>
                                        <xsl:for-each select="mtc:Discipline/mtc:SubDiscipline">
                                            <ul>
                                                <li>
                                                    <xsl:value-of select="."/>
                                                </li>
                                            </ul>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="mtc:ExternalReference">
                                    <br/>
                                    <span style="font-weight: bold; text-decoration: underline">External Reference</span>&#160;&#8208;&#160;
                                    <xsl:choose>
                                        <xsl:when test="mtc:ExternalReference/mtc:url">
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="mtc:ExternalReference/mtc:url"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="target">_blank</xsl:attribute>
                                                <xsl:value-of select="mtc:ExternalReference/@name"/>
                                            </xsl:element>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <p>
                                                <xsl:value-of select="mtc:ExternalReference/@name"/>
                                            </p>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:if test="mtc:ExternalReference/mtc:CategoryTag">
                                    <br/>
                                    <p style="font-weight: bold; text-decoration: underline">Category Tags</p>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Value</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <xsl:for-each select="mtc:ExternalReference/mtc:CategoryTag">
                                                <tr>
                                                    <td>
                                                        <xsl:value-of select="mtc:name"/>
                                                    </td>
                                                    <td>
                                                        <xsl:value-of select="mtc:value"/>
                                                    </td>
                                                </tr>
                                            </xsl:for-each>
                                        </tbody>
                                    </table>

                                </xsl:if>
                            </div>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
            <script src="metrologytaxonomy.js"></script>
        </html>
    </xsl:template>
</xsl:stylesheet>
