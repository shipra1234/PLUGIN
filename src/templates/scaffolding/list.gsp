<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
<body>
		<div class="row">
			<div class="col-md-2" id="row-mg">
				<div class="well">
					<ul class="nav nav-list" id="change">
						%{--<li class="nav-header">\${entityName}</li>--}%
						<li class="active">
							<g:link class="list" action="list">
								<i class="glyphicon glyphicon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="\${flash.message}">
					<g:hiddenField name="message" value="\${flash.message}" id="message"/>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
							allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
							props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
							Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
							props.eachWithIndex { p, i ->
								if (i < 6) {
									if (p.isAssociation()) { %>
							<th class="header"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
						<%      } else { %>
							<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
						<%  }   }   } %>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="\${${propertyName}List}" var="${propertyName}">
						<tr>
						<%  props.eachWithIndex { p, i ->
						        if (i < 6) {
									if (p.type == Boolean || p.type == boolean) { %>
							<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
						<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
							<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
						<%          } else { %>
							<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
						<%  }   }   } %>
							<td class="link">
								<g:link action="show" id="\${${propertyName}.id}" class="btn btn-primary">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="\${${propertyName}Total}" />
				</div>
			</div>

		</div>
	</body>
</html>
