<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>BiNChe -- Enrichment analysis using ChEBI</title>
<script type="text/javascript">
	function display(value) {
		var val = document.getElementById(value).value;
		if (val == "plain") {
			document.getElementById('plainInfo').style.display = 'block';
			document.getElementById('weightInfo').style.display = 'none';
		} else if (val == "weighted") {
			document.getElementById('plainInfo').style.display = 'none';
			document.getElementById('weightInfo').style.display = 'block';
		}
	}
</script>
<style type="text/css">
#loading {
	position: fixed;
	left: 0;
	top: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	min-height: 100%;
	background-color: white;
	text-align: center;
	opacity : 0.85;
	filter: alpha(opacity = 85);
}

#loadingtext {
	width: 100px;
	height: 100px;
	background-color: #FFF;
	text-align: center;
	padding: 100px 0 0 0;
	margin: 250px auto 0 auto;
}
</style>
</head>

<body>
	<center>
		<div id="loading" style="display: ;">
			<div id="loadingtext">
				Please wait...<br />
				  <img src="${ pageContext.request.contextPath }/images/ajax-loader.gif" border="0" /> 
			</div>
		</div>
		<h1>Enrichment Analysis</h1>
		<br /> Please enter your list of CHEBI ids, separated by space or
		newline. <br> <br> <br>


		<form action="${ pageContext.request.contextPath }/ValidateInput"
			method="post">
			<b>Chebi Ids</b>
			<table style="vertical-align: middle">
				<tr>
					<td style="padding: 10px"><textarea rows="10" cols="50"
							name="input"> </textarea></td>
				</tr>
				<tr>
					<td style="clear: both; padding: 10px"><br> <b>Select
							type of analysis </b> <br /> <span> <input type="radio"
							id="weighted" name="analysisType" value="weighted"
							checked="checked" onclick="display('weighted');" /> <b>Weighted
								Enrichment Analysis </b>
					</span> <span> <input type="radio" id="plain" name="analysisType"
							value="plain" onclick="display('plain');" /> <b>Enrichment
								Analysis </b> <br />
					</span> <br> <span id="weightInfo"
						style="display: none; padding: 2px"> This method accepts a
							list of CHEBI Ids and their weights. <br> Weight is a
							decimal value between 0 and 1.<br> This analysis runs on the
							ChEBI structure ontology.

					</span> <span id="plainInfo" style="display: none; padding: 2px">
							This method accepts a list of CHEBI Ids only.<br /> <br> <b>Select
								target of enrichment</b> <select name="type">
								<option value="structure">ChEBI structure
									classification</option>
								<option value="role" selected="selected">ChEBI role
									classification</option>
								<option value="both">ChEBI structures and roles</option>
						</select>
					</span><br> <input type="submit" value="Submit" onclick="document.getElementById('loading').style.display = 'block';"/>
					</td>
				</tr>
			</table>
		</form>

		<br> <br> <i>Test data (For reference)</i> <br>

		<table>
			<tr>
				<td>
					<table>
						<!-- Weighted table -->
						<tr>
							<td>CHEBI:17079</td>
							<td>0.7665</td>
						</tr>
						<tr>
							<td>CHEBI:46816</td>
							<td>0.7465</td>
						</tr>
						<tr>
							<td>CHEBI:28658</td>
							<td>0.7465</td>
						</tr>
						<tr>
							<td>CHEBI:28611</td>
							<td>0.7465</td>
						</tr>
						<tr>
							<td>CHEBI:28594</td>
							<td>0.6915</td>
						</tr>
						<tr>
							<td>CHEBI:17048</td>
							<td>0.6915</td>
						</tr>
						<tr>
							<td>CHEBI:7852</td>
							<td>0.60575</td>
						</tr>
						<tr>
							<td>CHEBI:3540</td>
							<td>0.509</td>
						</tr>
					</table>
				</td>
				<td>
					<table>
						<!-- Plain table -->
						<tr>
							<td>CHEBI:17079</td>
						</tr>
						<tr>
							<td>CHEBI:46816</td>
						</tr>
						<tr>
							<td>CHEBI:28658</td>
						</tr>
						<tr>
							<td>CHEBI:28611</td>
						</tr>
						<tr>
							<td>CHEBI:28594</td>
						</tr>
						<tr>
							<td>CHEBI:17048</td>
						</tr>
						<tr>
							<td>CHEBI:7852</td>
						</tr>
						<tr>
							<td>CHEBI:3540</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<script type="text/javascript">
			document.getElementById("loading").style.display = "none";
		</script>

	</center>
</body>
</html>
