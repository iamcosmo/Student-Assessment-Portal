<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Question Set</title>
    <link rel="stylesheet" href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css' />">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border-radius: 5px 5px 0 0;
        }
        .card-body {
            padding: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .tag-container {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            padding: 5px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            background-color: #ffffff;
        }
        .tag {
            display: inline-block;
            background-color: #e9ecef;
            border-radius: 20px;
            padding: 5px 10px;
            margin-right: 5px;
        }
        .tag a {
            margin-left: 8px;
            color: #6c757d;
            text-decoration: none;
        }
        .tag a:hover {
            color: #dc3545;
        }
        .available-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            margin-bottom: 10px;
        }
        .available-tag {
            cursor: pointer;
        }
        .available-tag:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <a href="${pageContext.request.contextPath}/admin/questionSets" class="btn btn-secondary">Back to Dashboard</a>
                </div>
                <div class="card">
                    <div class="card-header text-center">
                        <h2>Add Question Set</h2>
                    </div>
                    <div class="card-body">
                        <form:form id="addQuestionSetForm" action="${pageContext.request.contextPath}/admin/addQuestionSet" method="post" modelAttribute="questionSet">
                            <div class="mb-3">
                                <label for="name" class="form-label">Set Name:</label>
                                <form:input path="name" id="name" class="form-control"/>
                            </div>
                            <div class="mb-3">
                                <label for="subjectTags" class="form-label">Subject Tags:</label>
                                <div class="available-tags">
                                    <c:forEach var="tag" items="${subjectTags}">
                                        <span class="tag available-tag" data-id="${tag.id}">${tag.name}</span>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="mb-3">
                                <h5>Selected Tags:</h5>
                                <div id="selectedTags" class="tag-container"></div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Add Set</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {

            $(document).on('click', '.available-tag', function() {
                var tagId = $(this).data('id');
                var tagName = $(this).text();
                
                if (!$('#selectedTags').find('.tag[data-id="' + tagId + '"]').length) {
                    $('#selectedTags').append(
                        '<span class="tag" data-id="' + tagId + '">' + tagName + ' <a href="#" class="remove-tag">&times;</a></span>'
                    );
                    $('#selectedTags').append(
                        '<input type="hidden" name="subjectTags" value="' + tagId + '" class="hidden-input" />'
                    );
                }
            });

           
            $(document).on('click', '.remove-tag', function(e) {
                e.preventDefault();
                var tagId = $(this).closest('.tag').data('id');
                $(this).closest('.tag').remove();
                $('.hidden-input[value="' + tagId + '"]').remove();
            });

         
            $('#addQuestionSetForm').submit(function(e) {
                var isValid = true;
                var setName = $('#name').val().trim();
                var selectedTags = $('#selectedTags .tag').length;

                if (setName === "") {
                    isValid = false;
                    alert('Set Name is required.');
                }

                if (selectedTags === 0) {
                    isValid = false;
                    alert('At least one Subject Tag is required.');
                }

                if (!isValid) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
