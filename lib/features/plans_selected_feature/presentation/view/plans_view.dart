import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karim_flutter_task/core/utils/Custom_Button.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/data/repo/plan_repository.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/cubit/plan_selected_cubit.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/common/header_widget.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/plans/basic_plan_widget.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/plans/contact_cart.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/plans/extra_plan_widget.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/plans/pluse_plan_widget.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/plans/super_plan_widget.dart';

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlanSelectedCubit>(
      create: (context) =>
          PlanSelectedCubit(planRepository: PlanRepository())..loadPlans(),
      child: const _PlansViewContent(),
    );
  }
}

class _PlansViewContent extends StatelessWidget {
  const _PlansViewContent();

  void _onPlanSelected(BuildContext context, int index) {
    context.read<PlanSelectedCubit>().selectPlan(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const HeaderWidget(),
              BlocBuilder<PlanSelectedCubit, PlanSelectedState>(
                builder: (context, state) {
                  if (state is PlanSelectedLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PlanSelectedError) {
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state is PlanSelectedLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.plans.length + 1,
                      itemBuilder: (context, index) {
                        if (index == state.plans.length) {
                          return ContactCard();
                        }
                        final plan = state.plans[index];
                        switch (index) {
                          case 0:
                            return BasicPlanWidget(
                              plan: plan,
                              isSelected: plan.isSelected,
                              onTap: () => _onPlanSelected(context, index),
                            );
                          case 1:
                            return ExtraPlanWidget(
                              plan: plan,
                              isSelected: plan.isSelected,
                              onTap: () => _onPlanSelected(context, index),
                            );
                          case 2:
                            return PlusePlanWidget(
                              plan: plan,
                              isSelected: plan.isSelected,
                              onTap: () => _onPlanSelected(context, index),
                            );
                          case 3:
                            return SuperPlanWidget(
                              plan: plan,
                              isSelected: plan.isSelected,
                              onTap: () => _onPlanSelected(context, index),
                            );
                          default:
                            return const SizedBox.shrink();
                        }
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              CustomButton(text: 'التالي'),
            ],
          ),
        ),
      ),
    );
  }
}
