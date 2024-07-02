<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Question Set</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .dropdown-menu {
            max-height: 200px;
            overflow-y: auto;
        }
        .tag {
            display: inline-block;
            background-color: #e9ecef;
            border-radius: 20px;
            padding: 5px 10px;
            margin: 2px;
        }
        .tag a {
            margin-left: 8px;
            color: #6c757d;
            text-decoration: none;
        }
        .tag a:hover {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header text-center">
                        <h2>Edit Question Set</h2>
                    </div>
                    <div class="card-body">
                        <form:form action="${pageContext.request.contextPath}/admin/updateSet" method="post" modelAttribute="set">
                            <form:hidden path="id" value="${set.id}"/>
                            <div class="mb-3">
                                <label for="name" class="form-label">Set Name:</label>
                                <form:input path="name" id="name" class="form-control"/>
                            </div>
                            <div class="mb-3">
                                <label for="subjectTags" class="form-label">Subject Tags:</label>
                                <form:select path="subjectTags" id="subjectTags" class="selectpicker form-control" multiple="true" data-live-search="true">
                                    <form:options items="${subjectTags}" itemValue="id" itemLabel="name"/>
                                </form:select>
                            </div>
                            <div class="mb-3">
                                <h5>Selected Tags:</h5>
                                <div id="selectedTags" class="form-control"></div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Update Set</button>
                                <a href="${pageContext.request.contextPath}/admin/questionSets" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.selectpicker').selectpicker();

            function updateSelectedTags() {
                var selectedOptions = $('#subjectTags').find('option:selected');
                var selectedTags = [];
                selectedOptions.each(function() {
                    selectedTags.push({ id: $(this).val(), name: $(this).text() });
                });

                var selectedTagsContainer = $('#selectedTags');
                selectedTagsContainer.empty();
                selectedTags.forEach(function(tag) {
                    selectedTagsContainer.append(
                        '<span class="tag">' + tag.name + ' <a href="#" class="remove-tag" data-id="' + tag.id + '">&times;</a></span>'
                    );
                });
            }

            $('#subjectTags').on('changed.bs.select', function (e, clickedIndex, isSelected, previousValue) {
                updateSelectedTags();
            });

            $(document).on('click', '.remove-tag', function(e) {
                e.preventDefault();
                var tagId = $(this).data('id');
                $('#subjectTags option[value="' + tagId + '"]').prop('selected', false);
                $('.selectpicker').selectpicker('refresh');
                updateSelectedTags();
            });

            // Initially populate selected tags if any are pre-selected
            updateSelectedTags();
        });
    </script>
</body>
</html>
