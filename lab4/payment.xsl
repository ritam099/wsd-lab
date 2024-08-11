<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:payment="http://www.example.com/payment">
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
                    h1 {
                        font-family: Arial, sans-serif;
                        color: #333;
                    }
                </style>
            </head>
            <body>
                <h1>Domain Name: Payment Transactions</h1>
                <table border="1">
                    <tr>
                        <th>Username</th>
                        <th>Amount</th>
                        <th>Currency</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Card Number</th>
                        <th>Expiry Date</th>
                    </tr>
                    <xsl:for-each select="payment:transaction">
                        <tr>
                            <td><xsl:value-of select="payment:username"/></td>
                            <td><xsl:value-of select="payment:amount"/></td>
                            <td><xsl:value-of select="payment:currency"/></td>
                            <td><xsl:value-of select="payment:date"/></td>
                            <td><xsl:value-of select="payment:status"/></td>
                            <td><xsl:value-of select="payment:cardNumber"/></td>
                            <td><xsl:value-of select="payment:expiryDate"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
