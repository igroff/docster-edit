var concat = require('gulp-concat');
var gulp   = require('gulp');

gulp.task('scripts', function() {
  gulp.src(['lib/ckeditor/ckeditor.js'])
    .pipe(concat('all.js'))
    .pipe(gulp.dest('./site/'))
});

gulp.task('style', function(){
  gulp.src(['lib/ckeditor/contents.css'])
    .pipe(concat('all.css'))
    .pipe(gulp.dest('./site/'))
});

gulp.task('default', ['scripts', 'style']);
