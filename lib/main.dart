import 'package:flutter/material.dart';
import 'package:shram_setu_project/dashboards/HIRER/PastWorkersPage.dart';
import 'package:shram_setu_project/dashboards/HIRER/applicants_page.dart';
import 'package:shram_setu_project/dashboards/HIRER/available_workers.dart';
import 'package:shram_setu_project/dashboards/HIRER/hirer_profile.dart';
import 'package:shram_setu_project/dashboards/HIRER/my_posted_jobs_page.dart';
import 'package:shram_setu_project/dashboards/HIRER/post_job_page.dart';
import 'package:shram_setu_project/dashboards/HIRER/search_workers.dart';
import 'package:shram_setu_project/dashboards/HIRER/view_applicants_page.dart';
import 'package:shram_setu_project/dashboards/HIRER/worker_profile_view.dart';
import 'package:shram_setu_project/dashboards/WORKER/available_vacancies.dart';
import 'package:shram_setu_project/dashboards/WORKER/job_applied.dart';
import 'package:shram_setu_project/dashboards/WORKER/search_work_page.dart';
import 'package:shram_setu_project/dashboards/WORKER/worker_profile_total_view.dart';
import 'package:shram_setu_project/dashboards/WORKER/worker_rating.dart';
import 'package:shram_setu_project/pages/auth/auth_page.dart';
import 'package:shram_setu_project/pages/auth/create_account.dart';
import 'package:shram_setu_project/pages/auth/login_page.dart';
import 'package:shram_setu_project/pages/auth/reset_password.dart';
import 'package:shram_setu_project/pages/auth/success_screen.dart';
import 'package:shram_setu_project/pages/language_selection.dart';
import 'package:shram_setu_project/pages/role_selection.dart';
import 'package:shram_setu_project/pages/welcome_page.dart';
import 'dashboards/HIRER/hirer_dashboard.dart';
import 'dashboards/WORKER/profile_view_rating_page.dart';
import 'dashboards/WORKER/worker_dashboard.dart';
import 'dashboards/worker_more_page.dart';
import 'dashboards/WORKER/worker_profile_page.dart';
void main() => runApp(ShramSetuApp());

class ShramSetuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shram Setu',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // default backgroud color
        primaryColor: Color(0xFFFF6F00),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFFF6F00),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(), // Welcome Page( First page of our app )
        '/language': (context) => LanguageSelectionPage(), // Language selection page
        '/auth': (context) => AuthPage(), // Create or login button page
        '/login': (context) => LoginPage(), // login page
        '/create': (context) => CreateAccountPage(), // create new account page
        '/reset': (context) => ResetPasswordPage(), // password reset page
        '/success': (context) => SuccessScreen(), // success page showing that you successfully created or login the account
        '/role': (context) => RoleSelectionPage(), // Worker or Hirer
        '/hirer-dashboard': (context) => HirerDashboard(), //Hirer dashboard
        '/worker_dashboard': (context) => WorkerDashboard(), // worker dashboard

        // WORKER DASHBOARD CONNECTION OR ELEMENTS
        '/available_vacancies' :(context) => AvailableVacancies(),// List available vacancies page
        '/job_applied' :(context) => JobsAppliedPage(), // List of applied job
        '/profile_views': (context) => ProfileViewRatingPage(), // Worker profile views and rating page
        '/worker_profile': (context) => WorkerProfilePage(), // Worker profile page
        '/search_work': (context) => SearchWorkPage(), // Page for searching work
        '/total_worker_view': (context) => ProfileViewsDetailPage(), // Page TO display total views and who views their profile
        '/rating': (context) => RatingsDetailPage(), // Page to display rating given by peoples(hirer)

        // HIRER DASHBOARD CONNECTION OR ELEMENTS
        '/available_worker': (context) => AvailableWorkers(), // List of available workers page
        '/hirer_profile': (context) => HirerProfile(), // Hirer profile page
        '/search_workers': (context) => SearchWorkersPage(), // search worker page
        '/post_job': (context) => PostJobPage(), // post job vacancy
        '/my_posted_job': (context) => MyPostedJobsPage(), // to view my(hirer) posted job page
        '/view_applicants': (context) => ViewApplicantsPage(), // list of all applicants who applied in vacancy posted by hirer
        '/worker_profile_view': (context) => WorkerProfileView(), // to view worker profile page
        '/applicant_page' :(context) => ApplicantsPage(),
        '/past_workers': (context) => PastWorkersPage(),
        // for both dashboards --> Worker and Hirer
        '/worker_more': (context) => WorkerMorePage(), // More about our app, settings , logout option

      },
    );
  }
}
