﻿<cfoutput>
<div class="row-fluid" id="main-content">
	<div class="box">
		<!--- Body Header --->
		<div class="header">
			<i class="icon-road icon-large"></i>
			Security Rules
		</div>
		<!--- Body --->
		<div class="body">	
		
		<!--- messageBox --->
		#getPlugin("MessageBox").renderit()#
		
		<!--- Usage --->
		<div class="alert alert-error">
			<i class="icon-warning-sign icon-large"></i>
			Please remember that the security rules are fired in the order shown. You can drag and drop
			the rows to the desired order of firing. Be careful with security rules as with much power comes great responsibility!
		</div>
		
		<ul class="tipList">
			<li>Security rules are used to secure ContentBox according to incoming events or URLs, much like a firewall.</li>
			<li>The order of the rules is extremely important as they fire and traverse as you see them on screen.</li>
			<li>If a security rule has no permissions or roles it means that only authentication is needed.</li>
		</ul>
		
		<!--- entryForm --->
		#html.startForm(name="ruleForm",action=prc.xehRemoveRule)#
			#html.hiddenField(name="ruleID")#
		
			<!--- Content Bar --->
			<div class="well well-small" id="contentBar">
				<!--- Create Butons --->
				<cfif prc.oAuthor.checkPermission("SECURITYRULES_ADMIN")>
				<div class="buttonBar">
					<a href="#event.buildLink(prc.xehResetRules)#" class="confirmIt btn" 
						data-title="Really Reset All Rules?"
						data-message="We will remove all rules and re-create them to ContentBox factory defaults.">
						Reset Rules
					</a>
					<a href="#event.buildLink(prc.xehApplyRules)#" class="confirmIt btn" 
						data-title="Really Apply Rules?"
						data-message="Please be aware that you could be locked out of application if your rules are not correct.">
						Apply Rules
					</a>
					<a href="#event.buildLink(prc.xehEditorRule)#" class="btn btn-danger">
						Create Rule
					</a>
				</div>
				</cfif>
				<!--- Filter Bar --->
				<div class="filterBar">
					<div>
						#html.label(field="ruleFilter",content="Quick Filter:",class="inline")#
						#html.textField(name="ruleFilter",size="30",class="textfield")#
					</div>
				</div>
			</div>
			
			<div id="rulesTable">#renderView("securityRules/rulesTable")#</div>
			
		#html.endForm()#
		
		</div>
	</div>
</div>		
</cfoutput>