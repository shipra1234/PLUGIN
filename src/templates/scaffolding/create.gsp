<%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

			<div class="row">
				<div class="col-md-2" id="row-mg">
					<div class="well">
						<ul class="nav nav-list" id="change">
							%{--<li class="nav-header">\${entityName}</li>--}%
							<li>
								<g:link class="list" action="list">
									<i class="glyphicon glyphicon-list"></i>
									<g:message code="default.list.label" args="[entityName]" />
								</g:link>
							</li>
							<li class="active">
								<g:link class="create" action="create">
									<i class="glyphicon glyphicon-plus"></i>
									<g:message code="default.create.label" args="[entityName]" />
								</g:link>
							</li>
						</ul>
					</div>
				</div>
			
			<div class="col-md-8">
				<div class="page-header" id="header">
					<h1><g:message code="default.create.label" args="[entityName]" /></h1>
				</div>

				<g:if test="\${flash.message}">
					<g:hiddenField name="message" value="\${flash.message}" id="message"/>
				</g:if>

				<g:hasErrors bean="\${${propertyName}}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="\${${propertyName}}" var="error">
					<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="create" style="margin-left:200px;" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
						<fieldset>
							<g:render template="form"/>
							<div class="form-actions" style="margin-top:20px;">
								<button type="submit" class="btn btn-primary" id="btn1">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.create.label" default="Create" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>
				
			</div>

		</div>
	</body>
</html>
