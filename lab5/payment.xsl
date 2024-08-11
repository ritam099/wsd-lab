<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:payment="http://www.example.com/payment">
    <xsl:template match="/payment:transactions">
        <html>
            <head>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin: 20px 0;
                        font-size: 16px;
                        text-align: left;
                    }
                    th, td {
                        border: 1px solid #dddddd;
                        padding: 8px;
                    }
                    th {
                        background-color: #f2f2f2;
                        color: #333;
                    }
                    tr:nth-child(even) {
                        background-color: #f9f9f9;
                    }
                    tr:hover {
                        background-color: #f1f1f1;
                    }
                    h1,h2,h3,h4 {
                        font-family: Arial, sans-serif;
                        color: #333;
                    }
                </style>
            </head>
            <body>
                <h1>Transaction Records</h1>
                <table border="1">
                    <tr>
                        <th>Transaction ID</th>
                        <th>Payer Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Amount</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Method</th>
                        <th>Reference</th>
                    </tr>
                    <xsl:for-each select="payment:transaction">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="payment:payer/payment:name"/></td>
                            <td><xsl:value-of select="payment:payer/payment:phone"/></td>
                            <td><xsl:value-of select="payment:payer/payment:email"/></td>
                            <td><xsl:value-of select="payment:payer/payment:address"/></td>
                            <td><xsl:value-of select="payment:details/payment:amount"/></td>
                            <td><xsl:value-of select="payment:details/payment:date"/></td>
                            <td><xsl:value-of select="payment:details/payment:status"/></td>
                            <td><xsl:value-of select="payment:details/payment:method"/></td>
                            <td><xsl:value-of select="payment:details/payment:reference"/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <xsl:for-each select="payment:transaction">
                    <h2>Payer Name: <xsl:value-of select="payment:payer/payment:name"/></h2>
                    <h3>Transaction ID: <xsl:value-of select="@id"/></h3>
                    <h4>Items Purchased:</h4>
                    <table border="1">
                        <tr>
                            <th>Item Name</th>
                            <th>Price</th>
                        </tr>
                        <xsl:for-each select="payment:items/payment:item">
                            <tr>
                                <td><xsl:value-of select="payment:itemName"/></td>
                                <td><xsl:value-of select="payment:itemPrice"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
