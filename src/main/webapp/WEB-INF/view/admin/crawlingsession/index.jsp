<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><la:message key="labels.admin_brand_title" /> | <la:message
		key="labels.crawling_session_configuration" /></title>
<jsp:include page="/WEB-INF/view/common/admin/head.jsp"></jsp:include>
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="/WEB-INF/view/common/admin/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/common/admin/sidebar.jsp">
			<jsp:param name="menuCategoryType" value="log" />
			<jsp:param name="menuType" value="crawlingSession" />
		</jsp:include>

		<div class="content-wrapper">
			<%-- Content Header --%>
			<section class="content-header">
				<h1>
					<la:message key="labels.crawling_session_configuration" />
				</h1>
				<ol class="breadcrumb">
					<li class="active"><la:link href="/admin/crawlingsession">
							<la:message key="labels.crawling_session_title" />
						</la:link></li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<%-- Box Header --%>
							<div class="box-header with-border">
								<h3 class="box-title">
									<la:message key="labels.crawling_session_title" />
								</h3>
							</div>
							<%-- Box Body --%>
							<div class="box-body">
								<%-- Message --%>
								<div>
									<la:info id="msg" message="true">
										<div class="alert alert-info">${msg}</div>
									</la:info>
									<la:errors />
								</div>
								<div class="row">
									<div class="col-sm-12">
										<la:form styleClass="form-inline">
											<div class="form-group">
												<label for="sessionIdSearchBtn"><la:message
														key="labels.crawling_session_session_id_search" /></label>
												<la:text styleId="sessionIdSearchBtn" property="sessionId"
													styleClass="form-control"></la:text>
											</div>
											<div class="form-group">
												<button type="submit" class="btn btn-primary" name="search"
													value="<la:message key="labels.crawling_session_search" />">
													<la:message key="labels.crawling_session_search" />
												</button>
												<button type="submit" class="btn btn-secondary" name="reset"
													value="<la:message key="labels.crawling_session_reset" />">
													<la:message key="labels.crawling_session_reset" />
												</button>
											</div>
										</la:form>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<%-- List --%>
										<c:if test="${crawlingSessionPager.allRecordCount == 0}">
											<p class="callout callout-info">
												<la:message key="labels.list_could_not_find_crud_table" />
											</p>
										</c:if>
										<c:if test="${crawlingSessionPager.allRecordCount > 0}">
											<table class="table table-bordered table-striped">
												<thead>
													<tr>
														<th><la:message
																key="labels.crawling_session_session_id" /></th>
														<th><la:message
																key="labels.crawling_session_created_time" /></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="data" varStatus="s"
														items="${crawlingSessionItems}">
														<tr class="${s.index % 2 == 0 ? 'row1' : 'row2'}"
															data-href="${contextPath}/admin/crawlingsession/confirmpage/4/${f:u(data.id)}">
															<td>${f:h(data.sessionId)}</td>
															<td><fmt:formatDate
																	value="${fe:date(data.createdTime)}"
																	pattern="yyyy-MM-dd'T'HH:mm:ss" /></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</c:if>
									</div>
								</div>
							</div>
							<%-- Box Footer --%>
							<div class="box-footer">
								<div class="span12 center">
									<script>
									<!--
										function confirmToDeleteAll() {
											if (confirm('<la:message key="labels.crawling_session_delete_all_confirmation"/>')) {
												return true;
											} else {
												return false;
											}
										}
									// -->
									</script>
									<la:link href="deleteall"
										onclick="return confirmToDeleteAll();"
										styleClass="btn btn-danger">
										<la:message key="labels.crawling_session_delete_all_link" />
									</la:link>
								</div>
								<%-- Paging Info --%>
								<span><la:message key="labels.pagination_page_guide_msg"
										arg0="${f:h(crawlingSessionPager.currentPageNumber)}"
										arg1="${f:h(crawlingSessionPager.allPageCount)}"
										arg2="${f:h(crawlingSessionPager.allRecordCount)}" /></span>

								<%-- Paging Navigation --%>
								<ul class="pagination pagination-sm no-margin pull-right">
									<c:if test="${crawlingSessionPager.existPrePage}">
										<li class="prev"><la:link
												href="list/${crawlingSessionPager.currentPageNumber - 1}">
												<la:message key="labels.crud_link_prev_page" />
											</la:link></li>
									</c:if>
									<c:if test="${!crawlingSessionPager.existPrePage}">
										<li class="prev disabled"><a href="#"><la:message
													key="labels.crud_link_prev_page" /></a></li>
									</c:if>
									<c:forEach var="p" varStatus="s"
										items="${crawlingSessionPager.pageNumberList}">
										<li
											<c:if test="${p == crawlingSessionPager.currentPageNumber}">class="active"</c:if>><la:link
												href="list/${p}">${p}</la:link></li>
									</c:forEach>
									<c:if test="${crawlingSessionPager.existNextPage}">
										<li class="next"><la:link
												href="list/${crawlingSessionPager.currentPageNumber + 1}">
												<la:message key="labels.crud_link_next_page" />
											</la:link></li>
									</c:if>
									<c:if test="${!crawlingSessionPager.existNextPage}">
										<li class="next disabled"><a href="#"><la:message
													key="labels.crud_link_next_page" /></a></li>
									</c:if>
								</ul>

							</div>
						</div>
					</div>
				</div>

			</section>
		</div>

		<jsp:include page="/WEB-INF/view/common/admin/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/view/common/admin/foot.jsp"></jsp:include>
</body>
</html>

