﻿<cfoutput>
#html.startForm(name="contentEditForm",action=prc.xehContentSave,novalidate="novalidate")#
<!--- contentid --->
#html.hiddenField(name="contentID",bind=prc.content)#
<div class="row-fluid">
	<!--- main content --->
	<div class="span9" id="main-content">
		<div class="box">
			<!--- Body Header --->
			<div class="header">
				<i class="icon-tasks icon-large"></i>
				Custom HTML Editor
			</div>
			<!--- Body --->
			<div class="body">
	
				<!--- MessageBox --->
				#getPlugin("MessageBox").renderit()#
	
				<!--- fields --->
				#html.hiddenField(name="contentType",value="CustomHTML")#
				#html.textField(name="title",label="Title:",bind=prc.content,required="required",maxlength="200",class="textfield width98",size="50",title="A human friendly name for the content piece",wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
				<div id='slugCheckErrors'></div>
				#html.textField(name="slug",label="Slug:",bind=prc.content,required="required",maxlength="200",class="textfield width98",size="50",title="The slug used to retrieve this content piece",wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
				#html.textarea(name="description",label="Short Description:",bind=prc.content,rows=3,class="width98",title="A short description for metadata purposes",wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
				
				<!---ContentToolBar --->
				<div id="contentToolBar">
					
					<!--- editor selector --->
					<label for="contentEditorChanger" class="inline">Editor: </label>
					<cfif prc.oAuthor.checkPermission( "EDITORS_EDITOR_SELECTOR" )>
					#html.select(name="contentEditorChanger", 
								 options=prc.editors,
								 class="input-medium",
								 column="name",
								 nameColumn="displayName",
								 selectedValue=prc.defaultEditor,
								 onchange="switchEditor(this.value)")#
					</cfif>
					
					<!--- markup --->
					<label for="markup" class="inline">Markup: </label>
					#html.select(name="markup", 
								 class="input-medium",
								 options=prc.markups,
								 selectedValue=( prc.content.isLoaded() ? prc.content.getMarkup() : prc.defaultMarkup ))#
					
					<!---Right References Panel --->
					<div class="floatRight">
						<a href="javascript:previewContent()" class="btn" title="Quick Preview">
							<i class="icon-eye-open icon-large"></i>
						</a>
					</div>
				</div>
				
				<!--- content --->
				#html.textarea(name="content", bind=prc.content, required="required", rows="25", class="width98")#
			</div>
		</div>
	</div>

	<!--- main sidebar --->
	<div class="span3" id="main-sidebar">
		<!--- Info Box --->
		<div class="small_box">
			
			<div class="header">
				<i class="icon-cogs"></i>
				Actions
			</div>
			<div class="body">
	
				<!--- Publish Info --->
				#html.startFieldset(legend='<i class="icon-globe icon-large"></i> Publishing')#
	
					<!--- Action Bar --->
					<div class="actionBar">
						<div class="btn-group">
						<button class="btn" onclick="return to('#event.buildLink(prc.xehCustomHTML)#')">Cancel</button>
						&nbsp;
						<button type="submit" class="btn btn-danger">Save</button>
						</div>	
					</div>
	
				#html.endFieldSet()#
				
				<!---Begin Accordion--->
				<div id="accordion" class="accordion">
				    <!---Begin Cache Content--->
				    <div class="accordion-group">
                    	<div class="accordion-heading">
                      		<a class="accordion-toggle" data-toggle="collapse" data-parent="##accordion" href="##cachecontent">
                        		<i class="icon-hdd icon-large"></i> Cache Settings
                      		</a>
                    	</div>
                    	<div id="cachecontent" class="accordion-body collapse in">
                      		<div class="accordion-inner">
        						<!--- Cache Settings --->
        						#html.label(field="cache",content="Cache Content:",class="inline")#
        						#html.select(name="cache", options="Yes,No", selectedValue=yesNoFormat(prc.content.getCache()), class="input-block-level")#
        						#html.inputField(name="cacheTimeout",label="Cache Timeout (0=Use Global):",bind=prc.content,title="Enter the number of minutes to cache your content, 0 means use global default",class="input-block-level",size="10",maxlength="100")#
        						#html.inputField(name="cacheLastAccessTimeout",label="Idle Timeout: (0=Use Global)",bind=prc.content,title="Enter the number of minutes for an idle timeout for your content, 0 means use global default",class="input-block-level",size="10",maxlength="100")#
                      		</div>
                    	</div>
                  	</div>
                    <!---End Cache Content--->
				</div>
                <!---End Accordion--->	
			</div>
		</div>
	</div>
</div>
#html.endForm()#
</cfoutput>